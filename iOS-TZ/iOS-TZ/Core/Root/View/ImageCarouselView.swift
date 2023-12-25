import SwiftUI

struct ImageCarouselView: View {
    var imageUrls: [String]
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    AsyncImage(url: URL(string: imageUrls[index])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .tag(index)
                                .frame(width: 343, height: 257)
                                .cornerRadius(15)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 343, height: 257)
                                .cornerRadius(15)
                        @unknown default:
                            fatalError("Unknown case")
                        }
                    }
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()

            // Navigation Dots
            HStack {
                ForEach(0..<imageUrls.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.black.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 7, height: 7)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
            }
            .offset(y: 150)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView(imageUrls: ["url1", "url2", "url3"])
    }
}

