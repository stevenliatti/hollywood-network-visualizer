for {
  limitMovie <- 30 to 1 by -1
  limitActor <- 30 to 1 by -1
  limitActorFriends <- 20 to 1 by -1
} yield println(s"/graph/actors?limitMovie=$limitMovie&limitActor=$limitActor&limitActorFriends=$limitActorFriends")
