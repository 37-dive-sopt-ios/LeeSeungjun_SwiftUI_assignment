//
//  LoginView.swift
//  SOPT-SwiftUI-Assignment
//
//  Created by 이승준 on 12/6/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusedField: LoginField?
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                VStack {
                    HStack {
                        Button {
                        } label: {
                            Image(.leftPointer)
                                .resizable()
                                .frame(width: 15, height: 16)
                        }
                        Spacer()
                        Text("이메일 또는 아이디로 계속")
                            .font(.pretendard(.sb_18))
                        Spacer()
                    }
                    .padding([.bottom], 25)
                    
                    BaeminTextField(
                        input: $username,
                        placeholder: "이메일 또는 아이디를 입력해주세요.",
                        focusState: $focusedField,
                        myField: .username)
                    
                    BaeminTextField(
                        input: $password,
                        placeholder: "비밀번호",
                        focusState: $focusedField,
                        myField: .password)
                }
                .padding([.horizontal], 26)
                
                BaeminButton(
                    isAvailable: !username.isEmpty && !password.isEmpty,
                    title: "로그인",
                    action: {
                        path.append(1)
                    }
                )
                .padding([.top], 20)
                .padding([.horizontal], 16)
                
                HStack {
                    Text("계정 찾기")
                        .font(.pretendard(.body_r_14))
                    Image(.rightArrow)
                }
                .padding([.top], 32)
                
                Spacer()
            }
            .navigationDestination(for: Int.self) { step in
                WelcomeView(username: username)
            }
        }
    }
}

enum LoginField {
    case username
    case password
}

struct BaeminTextField: View {
    
    @Binding var input: String
    @State var isShowingPassword: Bool = false
    
    var placeholder: String
    var focusState: FocusState<LoginField?>.Binding
    var myField: LoginField
    
    private var isFocused: Bool {
        focusState.wrappedValue == myField
    }
    
    var body: some View {
        ZStack {
            if myField == .password && !isShowingPassword {
                SecureField(text: $input, prompt: Text(placeholder)) {
                    
                }
                .focused(focusState, equals: myField)
                .font(Font.pretendard(.body_r_14))
                .foregroundColor(.black)
                .padding([.vertical], 15)
                .overlay(borderView)
                .onTapGesture {
                    focusState.wrappedValue = myField
                }
            } else {
                TextField(text: $input, prompt: Text(placeholder)) {
                    
                }
                .focused(focusState, equals: myField)
                .font(Font.pretendard(.body_r_14))
                .foregroundColor(.black)
                .padding([.vertical], 15)
                .overlay(borderView)
                .onTapGesture {
                    focusState.wrappedValue = myField
                }
            }
            
            HStack(spacing: 16) {
                Spacer()
                if !input.isEmpty {
                    Button {
                        input = ""
                    } label: {
                        Image(.crossGray)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                if myField == .password {
                    Button {
                        isShowingPassword.toggle()
                    } label: {
                        Image(isShowingPassword ? .eyeSlash : .eye)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding([.trailing], 13)
                }
            }
        }
    }
    
    private var borderView: some View {
        RoundedRectangle(cornerRadius: 4)
            .stroke(
                isFocused ? Color.black : Color.gray.opacity(0.5),
                lineWidth: isFocused ? 2 : 1
            )
            .frame(height: 46)
            .padding(-10)
    }
}

struct LoginButton: View {
    var body: some View {
        VStack {
            Text("Text")
                .font(.pretendard(.bold_18))
        }
        .frame(height: 46)
    }
}

#Preview {
    LoginView()
}
