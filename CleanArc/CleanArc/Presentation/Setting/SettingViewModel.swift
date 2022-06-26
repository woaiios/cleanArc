//
//  SettingViewModel.swift
//  CleanArc
//
//  Created by SUN RUNHUI on 2022/06/26.
//

import Foundation

@MainActor
class SettingViewModel: ObservableObject {
    
    var getSettingsUseCase = GetSettingsUseCase(repo: SettingRepositoryImpl(dataSource: SettingAPIImpl()))
    @Published var settings: Setting = Setting()
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func getSettings() async {
        errorMessage = ""
        let result = await getSettingsUseCase.execute()
        switch result{
        case .success(let settings):
            self.settings = settings
        case .failure(let error):
            self.settings = Setting()
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
   
    func showCantact(_ date: Date) -> Bool {
        if settings.workHours.isEmpty {
            return false
        }
        
        // Only support format like: [M-F HH:mm - HH:mm]
        let weekday = Calendar.current.component(.weekday, from: date)
        
        // work day is from Mon to Fri
        if weekday <= 1 || weekday >= 7 {
            return false
        }
        
        let _workHours = [Character](settings.workHours)
        var startTime = [Character]()
        var endTime = [Character]()
        
        var readingStartTimeCharacters = true, idx = 4
        while idx < _workHours.count {
            if _workHours[idx] == " " {
                idx += 3
                readingStartTimeCharacters = false
                continue
            } else if readingStartTimeCharacters {
                startTime.append(_workHours[idx])
            } else if readingStartTimeCharacters == false  {
                endTime.append(_workHours[idx])
            }
            idx += 1
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterWithHour = DateFormatter()
        dateFormatterWithHour.dateFormat = "yyyy-MM-dd HH:mm"
        
        let startString = "\(dateFormatter.string(from: date)) \(String(startTime))"
        let endString = "\(dateFormatter.string(from: date)) \(String(endTime))"
        let endDate = dateFormatterWithHour.date(from: endString)!
        let startDate = dateFormatterWithHour.date(from: startString)!
        return (startDate ... endDate).contains(date)
    }
    
}
