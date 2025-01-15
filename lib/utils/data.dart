import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://avatars.githubusercontent.com/u/106983293?v=4";
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime.now(),
      sentBy: '1', // userId of who sends the message
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "Hi!",
      createdAt: DateTime.now(),
      sentBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '3',
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sentBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '4',
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sentBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '5',
      message: "That's fine",
      createdAt: DateTime.now(),
      sentBy: '2',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['1']),
      status: MessageStatus.read,
    ),
    Message(
      id: '6',
      message: "When to go ?",
      createdAt: DateTime.now(),
      sentBy: '3',
      status: MessageStatus.read,
    ),
    Message(
      id: '7',
      message: "I guess Simform will reply",
      createdAt: DateTime.now(),
      sentBy: '4',
      status: MessageStatus.read,
    ),
    Message(
      id: '8',
      message: "https://bit.ly/3JHS2Wl",
      createdAt: DateTime.now(),
      sentBy: '2',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{1F44D}', '\u{1F44D}'],
        reactedUserIds: ['2', '3', '4'],
      ),
      status: MessageStatus.read,
      replyMessage: const ReplyMessage(
        message: "Can you write the time and place of the meeting?",
        replyTo: '1',
        replyBy: '2',
        messageId: '4',
      ),
    ),
    Message(
      id: '9',
      message: "Done",
      createdAt: DateTime.now(),
      sentBy: '1',
      status: MessageStatus.read,
      reaction: Reaction(
        reactions: [
          '\u{2764}',
          '\u{2764}',
          '\u{2764}',
        ],
        reactedUserIds: ['2', '3', '4'],
      ),
    ),
    Message(
      id: '10',
      message: "Thank you!!",
      status: MessageStatus.read,
      createdAt: DateTime.now(),
      sentBy: '1',
      reaction: Reaction(
        reactions: ['\u{2764}', '\u{2764}', '\u{2764}', '\u{2764}'],
        reactedUserIds: ['2', '4', '3', '1'],
      ),
    ),
    Message(
      id: '11',
      message: "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sentBy: '1',
      reaction: Reaction(reactions: ['\u{2764}'], reactedUserIds: ['2']),
      status: MessageStatus.read,
    ),
    Message(
      id: '12',
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sentBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '13',
      message:
          "🤩🤩This is a very long message to test the character limit of the message field in our chat application. It should be exactly 220 characters long to ensure that our application can handle messages of this length without any issues.",
      createdAt: DateTime.now(),
      sentBy: '2',
      status: MessageStatus.read,
    ),
    Message(
      id: '13',
      message:
          "Hii ni ujumbe mrefu sana kwa Kiswahili ili kujaribu kikomo cha herufi za uwanja wa ujumbe katika programu yetu ya gumzo. Inapaswa kuwa na herufi 1000 ili kuhakikisha kuwa programu yetu inaweza kushughulikia ujumbe wa urefu huu bila matatizo yoyote. Tunajaribu kuona jinsi programu yetu inavyoweza kushughulikia maandishi marefu na kuhakikisha kuwa hakuna hitilafu zinazotokea wakati wa kuonyesha ujumbe huu. Hii ni muhimu sana kwa watumiaji wetu ambao wanataka kutuma ujumbe mrefu na wa kina. Tunataka kuhakikisha kuwa uzoefu wao wa kutumia programu yetu ni bora na bila matatizo yoyote. Kwa hivyo, tunajaribu ujumbe huu mrefu ili kuona jinsi programu yetu inavyoweza kushughulikia hali hii. Tunatumaini kuwa kila kitu kitakuwa sawa na kwamba programu yetu itafanya kazi kama inavyotarajiwa. Ikiwa kuna matatizo yoyote, tutayashughulikia na kuhakikisha kuwa programu yetu inaboreshwa zaidi. Asante kwa kutumia programu yetu na tunatarajia maoni yako ili tuweze kuendelea kuboresha huduma zetu. Hii ni sehemu ya kujitolea kwetu kwa ubora na kuhakikisha kuwa watumiaji wetu wanapata huduma bora zaidi. Tunathamini maoni yako na tunatarajia kusikia kutoka kwako hivi karibuni. Asante tena na tunakutakia siku njema. Endelea kufurahia kutumia programu yetu na usisite kuwasiliana nasi ikiwa una maswali yoyote au unahitaji msaada wowote. Tunapatikana kila wakati kusaidia na kuhakikisha kuwa unapata uzoefu bora zaidi. Asante na tunakutakia kila la heri.",
      createdAt: DateTime.now(),
      sentBy: '2',
      status: MessageStatus.read,
    ),
  ];
}
