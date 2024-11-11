//
//  DatePickerTextField.swift
//  FoodDelivery
//
//  Created by Neosoft on 11/11/24.
//

import SwiftUI

struct CustomDatePickerTextField: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    var onDateSelected: ((Date) -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView
            datePickerTextFieldView
        }
    }
    
    private var titleView: some View {
        Text(title)
            .font(.system(size: 14, weight: .medium))
    }
    
    private var datePickerTextFieldView: some View {
        HStack(spacing: 8) {
            DatePickerTextField(
                text: $text,
                placeholder: placeholder,
                onDateSelected: onDateSelected
            )
            
            Image(systemName: "calendar")
        }
        .padding(.horizontal, 20)
        .frame(height: 52.0)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.neutral40), lineWidth: 1)
        )
    }
}

struct DatePickerTextField: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String
    var onDateSelected: ((Date) -> Void)?
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        textField.placeholder = placeholder
        textField.text = text
        textField.delegate = context.coordinator
        textField.font = .systemFont(ofSize: 14, weight: .medium)
        
        // Set up date picker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        textField.inputView = datePicker
        
        // Toolbar with Done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: context.coordinator, action: #selector(context.coordinator.doneButtonTapped))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: context.coordinator, action: #selector(context.coordinator.cancelButtonTapped))
        
        toolbar.setItems([cancelButton, space, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: DatePickerTextField
        
        init(_ parent: DatePickerTextField) {
            self.parent = parent
        }
        
        @objc func dateChanged() {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            parent.text = formatter.string(from: parent.datePicker.date)
            parent.onDateSelected?(parent.datePicker.date)
        }
        
        @objc func doneButtonTapped() {
            dateChanged()
            parent.textField.resignFirstResponder()
        }
        
        @objc func cancelButtonTapped() {
            parent.textField.resignFirstResponder()
        }
    }
}
