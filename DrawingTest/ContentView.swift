//
//  ContentView.swift
//  DrawingTest
//
//  Created by Hoshito on 2019/11/27.
//  Copyright © 2019 Hoshito. All rights reserved.
//

import SwiftUI
import CoreGraphics

struct ContentView: View {

    @State private var name: String = "Tom"
    @State private var tap: Bool = false
    @State private var TapPosition: CGPoint = .zero
    @State private var lineWidth: CGFloat = 3.0
    @State private var SelectColor: String = "black"
    @State private var drawings_red: [Drawing] =  [Drawing]()
    @State private var drawings_black: [Drawing] =  [Drawing]()
    @State private var drawings_white: [Drawing] =  [Drawing]()
    @State private var currentDrawing_red: Drawing = Drawing()
    @State private var currentDrawing_black: Drawing = Drawing()
    @State private var currentDrawing_white: Drawing = Drawing()
    
    var body: some View {
        
       GeometryReader { geometry in
        
        VStack{
            HStack{
                Button(action: {
                    self.SelectColor = "red"
                    print(self.SelectColor)
                }) {
                    HStack {
                        Text("赤")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
                Button(action: {
                    self.SelectColor = "black"
                    print(self.SelectColor)
                }) {
                    HStack {
                        Text("黒")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(40)
                }
                Button(action: {
                    self.SelectColor = "white"
                    print(self.SelectColor)
                }) {
                    HStack {
                        Text("消しゴム")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
            }
            
                Rectangle()
                .fill(Color(white:0.95))
                .frame(width: geometry.size.width, height: geometry.size.height/1.2)
                .gesture(
                    DragGesture(minimumDistance: 0.1)
                    .onChanged({ (value) in
                        let currentPoint = value.location
                        if currentPoint.y >= 0
                            && currentPoint.y < geometry.size.height {
                            if self.SelectColor == "red"{
                                print("red_start")
                             self.currentDrawing_red.points.append(currentPoint)
                         }
                            else if self.SelectColor == "black"{
                                print("black_start")
                              self.currentDrawing_black.points.append(currentPoint)
                            }
                            else if self.SelectColor == "white"{
                                print("white_start")
                              self.currentDrawing_white.points.append(currentPoint)
                            }
                     }})
                    .onEnded({ (value) in
                     
                        if self.SelectColor == "red"{
                            print("red_end")
                           self.drawings_red.append(self.currentDrawing_red)
                            self.currentDrawing_red = Drawing()
                        }
                        else if self.SelectColor == "black"{
                            print("balck_end")
                            self.drawings_black.append(self.currentDrawing_black)
                           self.currentDrawing_black = Drawing()
                        }
                        else if self.SelectColor == "white"{
                            print("white_end")
                            self.drawings_white.append(self.currentDrawing_white)
                           self.currentDrawing_white = Drawing()
                        }
                     })
                    )
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { value in
                            self.TapPosition = value.startLocation
                            print(self.TapPosition)
                            self.tap = true
                        }
                )
                
                .overlay(
                    Path{ path in
                        for drawing in self.drawings_red {
                            self.add(drawing: drawing, toPath: &path)
                        }
                        self.add(drawing: self.currentDrawing_red, toPath: &path)
                    }
                    .stroke(Color.red, lineWidth: self.lineWidth)
                  
                    
                )

                .overlay(
                    Path{ path in
                        for drawing in self.drawings_black {
                                self.add(drawing: drawing, toPath: &path)
                            }
                        self.add(drawing: self.currentDrawing_black, toPath: &path)
                        }
                    .stroke(Color.black, lineWidth: self.lineWidth)
                
                )
                
                .overlay(
                      Path{ path in
                          for drawing in self.drawings_white {
                              self.add(drawing: drawing, toPath: &path)
                          }
                          self.add(drawing: self.currentDrawing_white, toPath: &path)
                      }
                      .stroke(Color(white: 0.95), lineWidth: 10)
//                      .blendMode()
                        
                   )
            
            .overlay(
                VStack{
                    if self.tap != false{
                        VStack{
                            TextField("Enter your name", text: self.$name)
                            Text("\(self.name)")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(40)
                        }
                        .offset(x:self.TapPosition.x,y:self.TapPosition.y-20)
                        
                    }
                }
            )
            
            }
        }
    }
    
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
    private func subtract(eraser: Drawing, toPath path: inout Path) {
        let points = eraser.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
