//
//  TaxProfile.swift
//  Abound
//
//  Created by Abound on 7/12/22.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct TaxProfile: View {
    var theme: AboundTheme
    var customContent: AboundCustomTextContent
    var onSuccess: (() -> Void)? = nil
    var onError: (() -> Void)? = nil
    
    public init(
        theme: AboundTheme = AboundTheme(),
        customContent: AboundCustomTextContent = AboundCustomTextContent(),
        onSuccess: (() -> Void)? = nil,
        onError: (() -> Void)? = nil
    ) {
        self.theme = theme
        self.onSuccess = onSuccess
        self.customContent = customContent
    }
    
    @available(iOS 13.0.0, *)
    public var body: some View {
        WebView(
            currentType: DocumentType.taxProfile,
            accessToken: Abound.accessToken,
            theme: theme,
            customContent: customContent,
            year: "2022",
            onSuccess: onSuccess,
            onError: onError
        )
    }
}

struct TaxProfilePreview: View {
    private var yourBrandsCustomTextContent = AboundCustomTextContent(
        submitButton:"Submit Button",
        loadingButton:"Loading Button",
        loadingPrompt: "Loading Prompt...",
        errorMessage: "Someething went wrong"
    );
    
    private var yourBrandsTheme = AboundTheme(
           text:AboundThemeText(size:"16px"),
           color: AboundThemeColor(background: "#FFFF00"),
           shape:AboundThemeShape(componentCornerRadius: "16px"),
           button: AboundThemeButton(colorActiveBackground: "#655BEF")
    );
    
    public init(){
        Abound.accessToken = "accessToken_testeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBfaWQiOiJhcHBJZF90ZXN0NDhlN2VhYTMxNzVhNjYzNTRlMDA2MjY1NDJkMiIsImNyZWF0ZWRfdGltZXN0YW1wIjoxNjU1MDk2NDAwMDAwLCJlbnZpcm9ubWVudCI6Imh0dHBzOi8vc2FuZGJveC1hcGkud2l0aGFib3VuZC5jb20vdjIiLCJleHBpcmF0aW9uX3RpbWVzdGFtcCI6MzI1MDM3MDE2MDAwMDAsInN0YXR1cyI6IkFjdGl2ZSIsInVzZXJfaWQiOiJ1c2VySWRfdGVzdDI0YjA1ZDc2MWZmNThiNTkzMWJkMDc3NzhjNjdiNGU4MThlNCIsImlhdCI6MTY1NTEzMDMxM30.dOUIyxTRV0QDmrFiy-GoyhKc8qru3pymIcPS5cGTaNk"

    }
  
    
       var body: some View {
           VStack {
               Text("Tax Profile")
               TaxProfile(
                theme: self.yourBrandsTheme,
                customContent: self.yourBrandsCustomTextContent
               )
           }
       }
}

struct TaxProfile_Previews: PreviewProvider {
    static var previews: some View {
        TaxProfilePreview()
    }
}
