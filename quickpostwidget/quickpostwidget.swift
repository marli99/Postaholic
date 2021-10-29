//
//  quickpostwidget.swift
//  quickpostwidget
//
//  Created by Marli Correia on 2021/10/29.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct quickpostwidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {

        
        VStack(spacing: 20){
            HStack{
                Text("Post to postaholic")
                Spacer()
                if widgetFamily == .systemMedium{
                Text(entry.date, style: .time)
                }
            }
            
            HStack(spacing: 20){
                Link(destination: URL(string: "widget://upload")!, label: {
                    Image(systemName: "square.and.arrow.up")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                }).padding(20)
                
                if widgetFamily == .systemMedium {
                Link(destination: URL(string: "widget://upload")!, label: {
                    Image(systemName: "camera")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                }).padding(20)
            }
                
            
            }
        }.padding()
    }
}

@main
struct quickpostwidget: Widget {
    let kind: String = "quickpostwidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            quickpostwidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My QuickPostWidget")
        .description("Quick Access to creating a post")
    }
}

struct quickpostwidget_Previews: PreviewProvider {
    static var previews: some View {
        quickpostwidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
