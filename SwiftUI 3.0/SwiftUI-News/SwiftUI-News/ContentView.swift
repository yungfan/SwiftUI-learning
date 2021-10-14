//
//  ContentView.swift
//  SwiftUI-News
//
//  Created by 杨帆 on 2021/10/14.
//

import SwiftUI

struct NewsModel: Codable {
    var reason: String
    var result: Result
    var error_code: Int
}

struct Result: Codable {
    var stat, page, pageSize: String
    var data: [News]
}

struct News: Codable, Hashable {
    var uniquekey, title, date, category, author_name, url, thumbnail_pic_s, is_content: String
}

class Network {
    let jsonDecoder = JSONDecoder()
    let session: URLSession = URLSession.shared
    let url: URL

    init(urlString: String) {
        url = URL(string: urlString)!
    }

    public func get<T: Codable>() async throws -> T {
        let (data, _) = try await session.data(for: URLRequest(url: url), delegate: nil)

        let t = try jsonDecoder.decode(T.self, from: data)

        return t
    }
}

@MainActor
class ViewModel: ObservableObject {
    @Published var news = [News]()
    var page = 1

    func getNews() async -> [News] {
        do {
            let model: NewsModel = try await Network(urlString: "http://v.juhe.cn/toutiao/index?type=top&key=聚合数据的key&page=\(page)&page_size=10").get()

            return model.result.data
        } catch {
            print(error)

            return []
        }
    }
}

struct ListRow: View {
    var news: News

    var newsImage: some View {
        AsyncImage(url: URL(string: news.thumbnail_pic_s)) { phase in
            switch phase {
            case .empty: // 未加载
                ProgressView()
                    .frame(width: 100, height: 80, alignment: .center)
            case let .success(image): // 加载成功
                image
                    .resizable()
                    .frame(width: 100, height: 80)
            case .failure: // 加载失败
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .foregroundStyle(.green)
            @unknown default:
                EmptyView()
            }
        }
    }

    var body: some View {
        HStack {
            newsImage

            VStack(alignment: .leading) {
                Text(news.title)
                    .font(.title3)
                    .foregroundStyle(.red)
                    .lineLimit(5)

                Spacer()

                HStack {
                    Text(news.author_name)
                        .font(.subheadline)
                        .foregroundStyle(.black)

                    Spacer()

                    Text(news.date.prefix(16).suffix(11))
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(8)
    }
}

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.news, id: \.self) { news in
                    ListRow(news: news)
                        .task {
                            if news == viewModel.news.last {
                                viewModel.page += 1

                                viewModel.news += await viewModel.getNews()
                            }
                        }
                }
            }
            .task {
                viewModel.news = await viewModel.getNews()
            }
            .refreshable {
                viewModel.page = 1
                viewModel.news = await viewModel.getNews()
            }
            .navigationTitle("头条新闻")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
