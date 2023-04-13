import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/pages/projects/backend/model/structs.dart';

abstract class ProjectsPort {
  Future<List<ProjectContent>> getAllProjects();

  Future<ProjectContent> getProjectById(String id) ;
}

class ImplProjectsPort implements ProjectsPort {
  final projects = List.of(
    [
      ProjectContent(
        "life",
        "Life - Your daily co-pilot",
        DescribedThing(
          descriptions: [
            PlainTextDescription("Eine App die Nutzer dabei unterstützt"),
            BulletPoint("den Alltag zielorientiert zu gestalten"),
            BulletPoint("langfristige Entscheidungen zu vereinfachen"),
            BulletPoint("mit anderen Nutzern zusammen zu arbeiten")
          ],
        ),
        PlainTextDescription(
            "Life ist mein erstes großes Projekt, durch das ich viel gelernt habe - sowohl technisch, als auch menschlich. \nAls ich die Idee bekam, hatte ich keine Ahnung wie ich eine App denn programmiere. Ich konnte zwar schon grundlegend Java, aber von sowas hatte ich dennoch keine Ahnung. Ich hatte zu der Zeit viel Freizeit und habe das tägliche Zocken allmählich mit täglichem Programmieren und Weiterbildung (Geschäftsmodellentwicklung, Startupfinanzierung, UI-Design, Projektplanung, User Driven Design, Softwareentwicklungsprozesse, Marketing, uvm.) ersetzt.\nIch habe bis Dezember 2020 native in Android programmiert und habe dann den Entschluss gefasst, das ganze Projekt ein mal neu aufzusetzen. Nach knappen 4 Monaten der Ideen- & Mockupentwicklung (das war das erste mal das ich Mockups gemacht habe), habe ich meine Idee bei meinem zukünftigem Partner gepitched.\nIm April haben wir dann mit Flutter & Rust unseren techstack festgelegt und haben losgelegt. Nach einem halben Jahr warm werden mit Flutter, habe ich das Frontend im Januar 2022 nochmal neu aufgesetzt (Ich wollte nicht endlos viel Zeit mit Refactoring und Bugfixing verbringen).\nIm November haben wir dann die erste Android Beta gelaunched und im Dezember folgte die iOS-Version. Nach diesem für mich persönlich großen Erfolg habe ich dann im Januar aber entschieden, Life mal eine Pause zu gönnen. Ich möchte die Arbeit gerne irgendwann wieder aufnehmen, aber nach knapp 3 Jahren umgeben von der selben Idee war ich nicht sonderlich glücklich.\nStand April 2023 kann ich sagen, dass ich froh bin über diese Entscheidung. Das Projekt hat meinen Alltag nicht mehr bestimmt und ich konnte mal wieder etwas aufleben und auch Motivation und Ansätze für die Wiederkehr gewinnen."),
        DateTime(2019, 12, 28),
        [
          DescribedThing(
            descriptions: [
              AdditionalInfo("Flutter / Dart"),
              AdditionalInfo("Android / Native"),
            ],
            title: "Tech",
          ),
        ],
        webUrl: "https://life-copilot.com",
        instagramName: "life_copilot",
      ),
      ProjectContent(
        "eventsoft",
        "Event Ticket System",
        DescribedThing(
          descriptions: [
            PlainTextDescription(
                "Seit kurzem arbeite ich zusammen mit einem befreundetem DJ an einer Platform mit der er als Veranstalter mit wenigen Prozenten Abgabe seine Tickets verkaufen kann. \n Dazu baue ich auf Pretix auf, einem Opensource Ticketing System."),
          ],
        ),
        PlainTextDescription("Hier muss ich noch schreiben"),
        DateTime(2023, 4, 1),
        [
          DescribedThing(
            descriptions: [
              AdditionalInfo("Flutter / Dart"),
              AdditionalInfo("Kotlin"),
              AdditionalInfo("Python"),
            ],
            title: "Tech",
          ),
        ],
      ),
      ProjectContent(
        "website",
        "Meine Eigene Website",
        DescribedThing(
          descriptions: [
            PlainTextDescription("Ich habe grade Urlaub und bin wegen des Wetters fast nur drin - ein langeweile Projekt also :D"),
          ],
        ),
        PlainTextDescription("Hier muss ich noch schreiben"),
        DateTime(2023, 4, 1),
        [
          DescribedThing(
            descriptions: [
              AdditionalInfo("Flutter / Dart"),
              AdditionalInfo("Kotlin"),
              AdditionalInfo("Python"),
            ],
            title: "Tech",
          ),
        ],
      )
    ],
  );

  @override
  Future<List<ProjectContent>> getAllProjects() {
    return Future.value(projects);
  }

  @override
  Future<ProjectContent> getProjectById(String id) {
    ProjectContent? content;
    for (var element in projects) {
      if(element.id == id) {
        content = element;
        break;
      }
    }
    if(content != null){
      return Future.value(content);
    }
    return Future.error("No Such Project");
  }
}
