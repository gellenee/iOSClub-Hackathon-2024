//
//  ViewModel.swift
//  question1
//
//  Created by glenne d. dela torre on 10/20/24.
//
import SwiftUI

class ViewModel: ObservableObject{
    @Published var feelings: [Int:[String]] = [1:[],2:[], 3:[], 4:[], 5:[], 6:[], 7:[], 8:[], 9:[], 10:[], 11:[], 12:[] ]
    
    func addItem(key: Int, val: String) -> [String]{
        var currValues: [String] = []
        if var feeling = feelings[key] {
            feeling.append(val)
            feelings[key] = feeling
            currValues = feeling
        }
        return currValues
    }
    
    func maxItem() -> String{
        let date = Date()
        let month = Calendar.current.component(.month, from: date)
        var moodMonth: String = ""
        if let feeling = feelings[month] {
            var shiningCount = 0
            var peacefulCount = 0
            var darkCount = 0
            for emotion in feeling{
                if emotion == "Shining"{
                    shiningCount += 1
                }
                else if emotion == "Peaceful"{
                    peacefulCount += 1
                }
                else if emotion == "Dark"{
                    darkCount += 1
                }
                if shiningCount > peacefulCount && shiningCount > darkCount{
                    moodMonth = "Shining"
                }
                else if peacefulCount > shiningCount && peacefulCount > darkCount{
                    moodMonth = "Peaceful"
                }
                else if darkCount > shiningCount && darkCount > shiningCount{
                    moodMonth = "Dark"
                }
            }
        }
        else{
            moodMonth = "No emotion yet"
        }
        return moodMonth
    }
}
