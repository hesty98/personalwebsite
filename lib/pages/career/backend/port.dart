import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/pages/career/backend/model/structs.dart';

abstract class PrimPort {
  Future<List<LifeEvent>> getAllEvents();

  Future<List<KnowledgeGroup>> getAllKnowledge();
}

class PrimPortImpl implements PrimPort {
  @override
  Future<List<LifeEvent>> getAllEvents() {
    return Future.value(
      [
        LifeEvent(
          "IT-Admin",
          PublicEntity("AStA Oldenburg", "https://asta-oldenburg.de"),
          PlainTextDescription("Zu meinen Aufgaben gehörte das verwalten einer nextcloud"),
          TimeRangeDescription(DateTime(2018, 10), DateTime(2020, 8)),
          Category.social,
          [],
          [],
        ),
        LifeEvent(
          "Bachelor",
          PublicEntity("Uni Oldenburg", ""),
          PlainTextDescription(""),
          TimeRangeDescription(DateTime(2016, 10), DateTime(2020, 8)),
          Category.education,
          [],
          [
            DescribedThing(
              title: "Note",
              descriptions: [
                AdditionalInfo("2,54"),
              ],
            )
          ],
        ),
        LifeEvent(
          "Software Entwickler",
          PublicEntity("Worldiety", "https://worldiety.de"),
          PlainTextDescription("Zu meinen Aufgaben gehörte das verwalten einer nextcloud"),
          TimeRangeDescription(DateTime(2020, 9), null),
          Category.career,
          [
            BulletPoint("Planung & Entwicklung von Backend & Frontend zur Bereitstellung neuer Produkte in einer Android App (Cewe Fotowelt)"),
            BulletPoint("Refactoring einer 10 Jahre alten Code-Basis: App auf neueste Android Standards bringen"),
            BulletPoint("Optimierung der Entwicklungs- & Kommunikationsprozesse im Projekt")
          ],
          [],
        ),
        LifeEvent(
          "App-Projekt: Life",
          null,
          PlainTextDescription("Zu meinen Aufgaben gehörte das verwalten einer nextcloud"),
          TimeRangeDescription(DateTime(2019, 12), DateTime(2023, 2)),
          Category.projects,
          [],
          [],
        )
      ],
    );
  }

  @override
  Future<List<KnowledgeGroup>> getAllKnowledge() {
    return Future.value([
      KnowledgeGroup("Fremdsprachen", [
        RatedThing("Deutsch", Rating(5, 5)),
        RatedThing("Englisch", Rating(4, 5)),
        RatedThing("Spanisch", Rating(1, 5)),
        RatedThing("Französisch", Rating(1, 5)),
      ]),
      KnowledgeGroup("Programmiersprachen", [
        RatedThing("Java", Rating(4, 5)),
        RatedThing("Kotlin", Rating(5, 5)),
        RatedThing("Dart", Rating(3, 5)),
        RatedThing("Go", Rating(1, 5)),
        RatedThing("Python", Rating(2, 5)),
      ]),
      KnowledgeGroup("Datenbanken", [
        RatedThing("SQLite", Rating(5, 5)),
        RatedThing("MySQL", Rating(5, 5)),
        RatedThing("OracleSQL", Rating(3, 5)),
        RatedThing("postgres", Rating(3, 5)),
        RatedThing("PL/SQL", Rating(1, 5)),
      ]),
      KnowledgeGroup("Frameworks & Packages", [
        RatedThing("Android", Rating(5, 5)),
        RatedThing("Flutter", Rating(4, 5)),
        RatedThing("Keycloak", Rating(3, 5)),
        RatedThing("Pretix", Rating(3, 5)),
      ]),
      KnowledgeGroup("Sonstiges", [
        RatedThing("UI/UX-Design (XD & Figma)", Rating(4, 5)),
        RatedThing("Requirements Engineering", Rating(4, 5)),
        RatedThing("Scrum Framework", Rating(4, 5)),
        RatedThing("Prozessoptimierung", Rating(2, 5)),
      ]),
    ]);
  }
}
