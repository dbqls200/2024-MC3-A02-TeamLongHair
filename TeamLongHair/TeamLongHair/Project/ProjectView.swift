//
//  ProjectView.swift
//  TeamLongHair
//
//  Created by 김유빈 on 7/26/24.
//

import SwiftUI

struct ProjectView: View {
    var project: Project
    
    @State var page: Page
    @State var link: Link?

    @State private var isShowingRightPanel = false
    @State private var isShowingTextField = false
    
    @State private var editingTitle: String = ""

    init(project: Project) {
        self.project = project
        self.page = self.project.pages[0]
    }
    
    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 8) {
                    Text("\(project.title)")
                        .font(.system(size: 16))
                        .foregroundStyle(.lbPrimary)
                        .lineLimit(1)
                    
                    Button {
                        isShowingTextField.toggle()
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                    .buttonStyle(defaultButtonStyle())
                }
                .padding(20)
                                
                if isShowingTextField {
                    TextField("Enter new title", text: $editingTitle) {
                        project.updateTitle(newTitle: editingTitle)
                        isShowingTextField = false
                    }
                    .textFieldStyle(.plain)
                    .font(.system(size: 16))
                    .foregroundStyle(.lbPrimary)
                    .padding(8)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.purple400, lineWidth: 1)
                            .foregroundColor(.white000)
                    }
                    .padding([.horizontal, .bottom], 12)
                }

                LinkPanelView(project: project, pages: project.pages, selectedPage: $page, selectedLink: $link)
            }
            .background(.white000)
            .frame(minWidth: 300)
        } detail: {
            CanvasView(selectedPage: $page, selectedLink: $link)
                .inspector(isPresented: $isShowingRightPanel) {
                    DetailPanelView(selectedLink: $link)
                        .inspectorColumnWidth(min: 300, ideal: 300, max: 300)
                }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    isShowingRightPanel.toggle()
                } label: {
                    Image(systemName: "sidebar.right")
                }
            }
        }
        .onAppear {
            updateProjectLastEditDate(project)
        }
        .onChange(of: link) {
            isShowingRightPanel = true
        }
    }
    
    private func updateProjectLastEditDate(_ project: Project) {
        project.lastEditDate = Date.now
    }
}

//#Preview {
//    ProjectView()
//}
