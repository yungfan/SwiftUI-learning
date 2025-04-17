import SwiftUI

// MARK: - Calendar Configuration
struct CalendarConfiguration {
    var accentColor: Color = .blue
    var todayColor: Color = .blue.opacity(0.1)
    var backgroundColor: Color = .white
    var secondaryBackgroundColor: Color = .white
    var textColor: Color = .primary
    var secondaryTextColor: Color = .gray
    var headerBackgroundColor: Color = .white
    var selectedTextColor: Color = .white
    var weekdayHeaderColor: Color = .gray.opacity(0.8)
}

// MARK: - Calendar View
struct CalendarView: View {
    let configuration: CalendarConfiguration
    let onDateSelected: (Date) -> Void
    
    @State private var displayedMonth: Date
    @State private var selectedDate: Date?
    @State private var calendarDays: [[CalendarDay]] = []
    @State private var animationAmount: CGFloat = 1.0
    
    private let calendar = Calendar.current
    private let today = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    
    init(
        initialDate: Date = Date(),
        configuration: CalendarConfiguration = CalendarConfiguration(),
        onDateSelected: @escaping (Date) -> Void
    ) {
        self.displayedMonth = initialDate
        self.configuration = configuration
        self.onDateSelected = onDateSelected
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CalendarHeaderView(
                displayedMonth: displayedMonth,
                onPreviousMonth: { withAnimation { changeMonth(by: -1) } },
                onNextMonth: { withAnimation { changeMonth(by: 1) } },
                configuration: configuration
            )
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(configuration.headerBackgroundColor)
            
            WeekdayHeaderView(configuration: configuration)
                .padding(.top, 8)
                .padding(.horizontal)
            
            CalendarGridView(
                calendarDays: calendarDays,
                displayedMonth: displayedMonth,
                selectedDate: selectedDate,
                configuration: configuration,
                onDaySelected: selectDate
            )
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .background(configuration.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
        .onAppear {
            updateCalendarDays()
        }
    }
    
    private func changeMonth(by value: Int) {
        displayedMonth = calendar.date(byAdding: .month, value: value, to: displayedMonth) ?? displayedMonth
        updateCalendarDays()
    }
    
    private func selectDate(day: Int, isCurrentMonth: Bool) {
        guard isCurrentMonth else { return }
        
        var components = calendar.dateComponents([.year, .month], from: displayedMonth)
        components.day = day
        
        if let date = calendar.date(from: components) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedDate = date
            }
            onDateSelected(date)
        }
    }
    
    private func updateCalendarDays() {
        var allDays = [CalendarDay]()
        let monthRange = calendar.range(of: .day, in: .month, for: displayedMonth)!
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: displayedMonth))!
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        let weekdayOffset = (firstWeekday + 5) % 7
        
        // Previous month days
        if weekdayOffset > 0 {
            let prevMonth = calendar.date(byAdding: .month, value: -1, to: firstDayOfMonth)!
            let prevMonthRange = calendar.range(of: .day, in: .month, for: prevMonth)!
            let prevMonthDays = prevMonthRange.count
            
            for i in 0 ..< weekdayOffset {
                let day = prevMonthDays - weekdayOffset + i + 1
                allDays.append(CalendarDay(day: day, isCurrentMonth: false))
            }
        }
        
        // Current month days
        for day in 1 ... monthRange.count {
            allDays.append(CalendarDay(day: day, isCurrentMonth: true))
        }
        
        // Next month days
        let remainingDays = 42 - allDays.count
        for day in 1 ... remainingDays {
            allDays.append(CalendarDay(day: day, isCurrentMonth: false))
        }
        
        // Group into weeks
        calendarDays = stride(from: 0, to: allDays.count, by: 7).map {
            Array(allDays[$0 ..< min($0 + 7, allDays.count)])
        }
    }
}

// MARK: - Calendar Header View
private struct CalendarHeaderView: View {
    let displayedMonth: Date
    let onPreviousMonth: () -> Void
    let onNextMonth: () -> Void
    let configuration: CalendarConfiguration
    
    private let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMMM yyyy"
        return f
    }()
    
    var body: some View {
        HStack {
            Button(action: onPreviousMonth) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(configuration.textColor)
                    .frame(width: 32, height: 32)
                    .background(configuration.secondaryBackgroundColor)
                    .clipShape(Circle())
            }
            
            Spacer()
            
            Text(formatter.string(from: displayedMonth))
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(configuration.textColor)
            
            Spacer()
            
            Button(action: onNextMonth) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(configuration.textColor)
                    .frame(width: 32, height: 32)
                    .background(configuration.secondaryBackgroundColor)
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - Weekday Header View
private struct WeekdayHeaderView: View {
    let configuration: CalendarConfiguration
    private let calendar = Calendar.current
    
    private var weekdays: [String] {
        let symbols = calendar.shortStandaloneWeekdaySymbols
        return Array(symbols[1...6] + [symbols[0]])
    }
    
    var body: some View {
        HStack {
            ForEach(weekdays, id: \.self) { weekday in
                Text(weekday)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(configuration.weekdayHeaderColor)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

// MARK: - Calendar Grid View
private struct CalendarGridView: View {
    let calendarDays: [[CalendarDay]]
    let displayedMonth: Date
    let selectedDate: Date?
    let configuration: CalendarConfiguration
    let onDaySelected: (Int, Bool) -> Void
    
    private let calendar = Calendar.current
    private let today = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 8) {
            ForEach(calendarDays.flatMap { $0 }.indices, id: \.self) { index in
                let calDay = calendarDays.flatMap { $0 }[index]
                DayCell(
                    day: calDay.day,
                    isSelected: isDateSelected(day: calDay.day, isCurrentMonth: calDay.isCurrentMonth),
                    isCurrentMonth: calDay.isCurrentMonth,
                    isToday: isToday(day: calDay.day, isCurrentMonth: calDay.isCurrentMonth),
                    configuration: configuration
                )
                .onTapGesture {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        onDaySelected(calDay.day, calDay.isCurrentMonth)
                    }
                }
            }
        }
    }
    
    private func isToday(day: Int, isCurrentMonth: Bool) -> Bool {
        guard isCurrentMonth else { return false }
        let displayedComponents = calendar.dateComponents([.year, .month], from: displayedMonth)
        return displayedComponents.year == today.year &&
        displayedComponents.month == today.month &&
        day == today.day
    }
    
    private func isDateSelected(day: Int, isCurrentMonth: Bool) -> Bool {
        guard let selectedDate = selectedDate,
              isCurrentMonth else { return false }
        
        let components = calendar.dateComponents([.year, .month, .day], from: selectedDate)
        let currentComponents = calendar.dateComponents([.year, .month], from: displayedMonth)
        
        return components.year == currentComponents.year &&
        components.month == currentComponents.month &&
        components.day == day
    }
}

// MARK: - Day Cell View
private struct DayCell: View {
    let day: Int
    let isSelected: Bool
    let isCurrentMonth: Bool
    let isToday: Bool
    let configuration: CalendarConfiguration
    
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            if isSelected {
                Circle()
                    .fill(configuration.accentColor)
                    .scaleEffect(isPressed ? 0.9 : 1.0)
            } else if isToday {
                Circle()
                    .fill(configuration.todayColor)
            }
            
            Text("\(day)")
                .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
                .foregroundColor(textColor)
        }
        .frame(height: 40)
        .contentShape(Circle())
        .scaleEffect(isPressed ? 0.9 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
    }
    
    private var textColor: Color {
        if isSelected {
            return configuration.selectedTextColor
        } else if !isCurrentMonth {
            return configuration.secondaryTextColor
        } else if isToday {
            return configuration.accentColor
        } else {
            return configuration.textColor
        }
    }
}

// MARK: - Supporting Types
struct CalendarDay {
    let day: Int
    let isCurrentMonth: Bool
}
