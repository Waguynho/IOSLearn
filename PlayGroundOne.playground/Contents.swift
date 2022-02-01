let vehicle = Vehicle(wheels: 1)

let cancellable = vehicle.$wheels // Accessing publisher with $ operator.
    .sink { wheels in
        print("Number of wheels: \(wheels)")
        if wheels ==  4 {
            cancellable.cancel()
        }
}

