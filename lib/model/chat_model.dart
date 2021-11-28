class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avaterUrl;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.avaterUrl});
}

List<ChatModel> chatList = [
  ChatModel(
      name: "Pitossky",
      message: "How did your day go?",
      time: "07:35",
      avaterUrl:
          "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg"),
  ChatModel(
      name: "Pears Jackson",
      message: "This is an amazing platform",
      time: "09:40",
      avaterUrl:
          "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg"),
  ChatModel(
    name: "Ronald Sketch",
    message: "You are ready!",
    time: "17:55",
    avaterUrl:
        "https://www.incimages.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg",
  ),
  ChatModel(
    name: "Winifred Barbra",
    message: "Hello, Awesome App!",
    time: "06:30",
    avaterUrl:
        "https://www.bkacontent.com/wp-content/uploads/2020/10/Untitled-design-2.webp",
  ),
  ChatModel(
      name: "Richard Richard",
      message: "Get me some good wine!",
      time: "09:35",
      avaterUrl:
          "https://www.harleytherapy.co.uk/counselling/wp-content/uploads/16297800391_5c6e812832.jpg"),
  ChatModel(
    name: "Nazara Michaels",
    message: "Take  a day off!!",
    time: "18:06",
    avaterUrl:
        "https://www.bkacontent.com/wp-content/uploads/2020/10/Untitled-design-2.webp",
  ),
];
