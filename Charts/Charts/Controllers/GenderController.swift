import SwiftUICharts
import SwiftUI

struct GenderController {
    
    private let dao = PersonDao()
    private var percentageData: ChartData
    private var amountData: ChartData
    
    init(){
        percentageData = ChartData( values:
            [
                ("Male %",dao.countPercentageBy(.male)),
                ("Female %",dao.countPercentageBy(.female)),
                ("Unown %",dao.countPercentageBy(.unown))
            ])
        
        amountData = ChartData( values:
            [
                ("Male",dao.countBy(.male)),
                ("Female",dao.countBy(.female)),
                ("Unown",dao.countBy(.unown))
            ])
    }
    
    public func getDataBy(typeChart: TypeChart) -> ChartData {
        
        if typeChart == .Amount {
            return amountData
        }
        
        return percentageData
    }
    
}

enum TypeChart{
    case Amount
    case Percentage
}
