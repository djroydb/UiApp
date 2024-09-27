//
//  ContentView.swift
//  UiApp
//
//  Created by Robson Freitas on 26/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var senha: String = ""
    @State var isPassVisible: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Bem vindo!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    TextField("Digite seu Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text("Senha")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    
                    HStack(alignment: .bottom) {
                        Group {
                            if isPassVisible {
                                TextField("Digite sua Senha", text: $senha)
                                    .autocorrectionDisabled(true)
                            } else {
                                SecureField("Digite sua Senha", text: $senha)
                                    
                            }
                        }
                        
                        
                        Button(action: {
                            isPassVisible.toggle()
                        }, label: {
                            Image(systemName: isPassVisible ? "eye.slash" : "eye")
                                .foregroundColor(.black)
                                
                        })
                        
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Esqueci o Login/Senha?")
                            .foregroundColor(.white)
                            .font(.callout)
                    })
                    .padding(.bottom)
                }
                
                
                Button(action: {}, label: {
                    Text("Entrar")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color.red.opacity(0.7))
                        .cornerRadius(8)
                    
                })
                
                Button(action: {}, label: {
                    Text("Não tenho uma conta")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray, lineWidth: 1))
                        .cornerRadius(8)
                    
                })
                
                
                Button(action: {}, label: {
                    Text("Entre em contato")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .padding(.top)
                        .font(.callout)
                })
                
            }
            .padding()
            .background(BlurView(style: .systemThinMaterialDark))
            .cornerRadius(15)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct BlurView: UIViewRepresentable {
    var style = UIBlurEffect.Style.dark
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
    
}

#Preview {
    ContentView()
}
