////
////  Draw_red.swift
////  DrawingTest
////
////  Created by Hoshito on 2019/11/27.
////  Copyright © 2019 Hoshito. All rights reserved.
////
//
//import SwiftUI
//
//struct Draw_red: View {
//    
//    @State private var currentDrawing_red: Drawing_red = Drawing_red()
//    @Binding var drawings_red: [Drawing_red]
//    var color: Color
//    @State private var change_color: Color = Color.black
//    var SelectColor: String
//    @Binding var lineWidth: CGFloat
//    
//    @State private var currentDrawing_black: Drawing_black = Drawing_black()
//    @Binding var drawings_black: [Drawing_black]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            Path { path in
//                for drawing in self.drawings_black {
//                    self.add_black(drawing: drawing, toPath: &path)
//                }
//            }.stroke(Color.black, lineWidth: self.lineWidth)
//            
//        Path { path in
//                       
////               print("1")
////               for drawing in self.drawings_black {
////                   self.add_black(drawing: drawing, toPath: &path)
////               }
////               print("2")
////               self.add_black(drawing: self.currentDrawing_black, toPath: &path)
//                print("red is working")
//                for drawing in self.drawings_red {
//                    self.add_red(drawing: drawing, toPath: &path)
//                }
//                self.add_red(drawing: self.currentDrawing_red, toPath: &path)
//            }
//                .stroke(Color.red, lineWidth: self.lineWidth)
//        .background(Color.blue)
//                .gesture(
//                   DragGesture(minimumDistance: 0.1)
//                       .onChanged({ (value) in
//                           
//                           let currentPoint = value.location
//                           if currentPoint.y >= 0
//                               && currentPoint.y < geometry.size.height {
//                            print("red_1")
//                               if self.SelectColor == "red"{
//                                self.currentDrawing_red.points.append(currentPoint)
//                            }
//                        }})
//                       .onEnded({ (value) in
//                        print("red_2")
//                           if self.SelectColor == "red"{
//                              self.drawings_red.append(self.currentDrawing_red)
//                               self.currentDrawing_red = Drawing_red()
//                           }
//                        }
//                       )
//                    )
//        }
//        .frame(maxHeight: .infinity)
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//        
//    }
//    
//    private func add_red(drawing: Drawing_red, toPath path: inout Path) {
//        let points = drawing.points
//        if points.count > 1 {
//            for i in 0..<points.count-1 {
//                let current = points[i]
//                let next = points[i+1]
//                path.move(to: current)
//                path.addLine(to: next)
//            }
//        }
//    }
//    
//    
//    
//    private func add_black(drawing: Drawing_black, toPath path: inout Path) {
//        let points = drawing.points
//        if points.count > 1 {
//            for i in 0..<points.count-1 {
//                let current = points[i]
//                let next = points[i+1]
//                path.move(to: current)
//                path.addLine(to: next)
//            }
//        }
//    }
//    
//    
//    
//}
