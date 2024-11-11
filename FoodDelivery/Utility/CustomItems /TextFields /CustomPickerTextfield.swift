//
//  PickerTextfield.swift
//  FoodDelivery
//
//  Created by Neosoft on 08/11/24.
//

import SwiftUI


struct CustomPickerTextfield: View {
    let title: String
    @Binding var text: String
    let placeHolder: String
    let options: [String]
    var onSelection: ((String) -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView
            textfieldView
        }
    }
    
    private var titleView: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
    }
    
    private var textfieldView: some View {
        HStack(spacing: 8) {
            PickerTextField(
                text: $text,
                placeholder: placeHolder,
                options: options,
                onSelection: onSelection
            )
            
            Image(systemName: "chevron.down")
        }
        .padding(.horizontal, 20)
        .frame(height: 52.0)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.neutral40), lineWidth: 1)
        )
    }
}


struct PickerTextField: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String
    let options: [String]
    var onSelection: ((String) -> Void)? = nil
    private let textField = UITextField()
    private let pickerView = UIPickerView()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        textField.placeholder = placeholder
        textField.text = text
        textField.delegate = context.coordinator
        textField.font = .systemFont(ofSize: 14, weight: .medium)
        
        // Set up picker view
        pickerView.delegate = context.coordinator
        pickerView.dataSource = context.coordinator
        textField.inputView = pickerView
        
        // Toolbar with Done button
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: context.coordinator, action: #selector(context.coordinator.doneButtonTapped))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: context.coordinator, action: #selector(context.coordinator.cancelButtonTapped))
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([cancelButton, space, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
        var parent: PickerTextField
        
        init(_ parent: PickerTextField) {
            self.parent = parent
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            parent.options.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            parent.options[row]
        }
        
        @objc func doneButtonTapped() {
            let selectedRow = parent.pickerView.selectedRow(inComponent: 0)
            if selectedRow <= parent.options.count-1{
                let selectedOption = parent.options[selectedRow]
                parent.text = selectedOption
                parent.onSelection?(selectedOption)
            }
            parent.textField.resignFirstResponder()
        }
        
        @objc func cancelButtonTapped() {
            parent.textField.resignFirstResponder()
        }
    }
}
