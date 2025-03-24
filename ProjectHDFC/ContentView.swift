//
//  ContentView.swift
//  ProjectHDFC
//
//  Created by Shubham on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("HDFC BANK")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "gearshape")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)

            ScrollView {
                VStack(alignment: .leading) {
                    // Account Section
                    AccountCard(title: "HDFC Savings Account", amount: "₹ 2,45,000.74")
                    AccountCard(title: "HDFC Current Account", amount: "₹ 74,500.74")

                    // Quick Actions
                    SectionTitle(title: "Quick Actions")
                    HStack {
                        QuickActionButton(icon: "doc.text", title: "Any Bill Payments")
                        QuickActionButton(icon: "arrow.right.arrow.left", title: "Money Transfer")
                        QuickActionButton(icon: "paperplane", title: "UPI Payment")
                        QuickActionButton(icon: "person.badge.plus", title: "Add Any Payee")
                    }

                    // Recharge Wallet Section
                    SectionTitle(title: "Recharge Your Wallet")
                    PromoBanner()
                    
                    // Recurring Deposit Section
                    SectionTitle(title: "Recurring Deposit")
                    AccountCard(title: "", amount: "₹ --,---.--")
                    
                    // Due Bills & Scan & Pay
                    SectionTitle(title: "Due Bills")
                    ScanAndPayButton()
                }
                .padding()
            }
            
            // Bottom Navigation Bar
            HStack {
                BottomNavButton(title: "Pay", icon: "creditcard")
                BottomNavButton(title: "Save", icon: "square.and.arrow.down")
                BottomNavButton(title: "Invest", icon: "chart.bar")
            }
            .padding()
            .background(Color.blue.opacity(0.1))
        }
    }
}

struct AccountCard: View {
    var title: String
    var amount: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(amount)
                .font(.title)
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct QuickActionButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .padding()
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            Text(title)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.top)
    }
}

struct PromoBanner: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue.opacity(0.2))
            .frame(height: 100)
            .overlay(Text("DISCOVER EXCLUSIVE OFFERS").bold())
    }
}

struct ScanAndPayButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "qrcode.viewfinder")
                Text("Scan & Pay")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct BottomNavButton: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
