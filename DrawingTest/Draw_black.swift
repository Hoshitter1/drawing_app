////
////  Draw_black.swift
////  DrawingTest
////
////  Created by Hoshito on 2019/11/27.
////  Copyright © 2019 Hoshito. All rights reserved.
////
//
//import SwiftUI
//
//struct Draw_black: View {
//    
//    @State private var currentDrawing_black: Drawing_black = Drawing_black()
//    @Binding var drawings_black: [Drawing_black]
//    var color: Color
//    var SelectColor: String
//    @Binding var lineWidth: CGFloat
//        
//    var body: some View {
//        GeometryReader { geometry in
//            Path { path in
//                
//                print("black is working")
//                
//                for drawing in self.drawings_black {
//                    self.add(drawing: drawing, toPath: &path)
//                }
//                self.add(drawing: self.currentDrawing_black, toPath: &path)
//            }
//            .stroke(Color.black, lineWidth: self.lineWidth)
//            .background(Color(white: 0.95))
//            .gesture(
//                    DragGesture(minimumDistance: 0.1)
//                        .onChanged({ (value) in
//                            print("black_1")
//                            let currentPoint = value.location
//                            if currentPoint.y >= 0
//                                && currentPoint.y < geometry.size.height {
//                                if self.SelectColor == "black"{
//                                    print("BLACK_REALLY_WORKING")
//                                    self.currentDrawing_black.points.append(currentPoint)
//                                }
//                            }
//                        })
//                        .onEnded({ (value) in
//                            print("black_2")
//                            if self.SelectColor == "black"{
//                                self.drawings_black.append(self.currentDrawing_black)
//                                self.currentDrawing_black = Drawing_black()
//                            }
//                        })
//                )
//            
//        }
//        .frame(maxHeight: .infinity)
//    }
//    
//    private func add(drawing: Drawing_black, toPath path: inout Path) {
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
//}
