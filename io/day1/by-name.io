methodName := "doThing"

subject := Object clone
subject doThing := method("Done!" println)

subject perform(methodName)
