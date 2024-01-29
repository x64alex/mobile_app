import SwiftUI


struct MealsListView: View {
    @ObservedObject private var mealViewModel = MealViewModel<Meal>()
    
    var body: some View {
        
        VStack {
            if mealViewModel.isOffline && mealViewModel.meals.isEmpty {
                Text("Offline: Unable to fetch meals")
                    .foregroundColor(.red)
                    .padding()
                Button("Retry") {
                    mealViewModel.fetchMeals()
                }
            } else {
                if mealViewModel.meals.isEmpty {
                    Text("Loading...")
                } else {
                    List(mealViewModel.meals) { meal in
                        Text(meal.name)
                    }
                }
            }
        }
        .onAppear {
            if mealViewModel.meals.isEmpty {
                mealViewModel.fetchMeals()
            }
        }
    }
    
}
