import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_saat_ogrenme/oyun_saat_ogrenme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(saatOgrenmeConfig.title.length, 33);
    expect(saatOgrenmeConfig.tagline.length, 33);
    for (final s in saatOgrenmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(saatOgrenmeConfig.gameId, saatOgrenmeId);
    expect(saatOgrenmeRules.gameId, saatOgrenmeId);
    expect(saatOgrenmeConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(saatOgrenmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: saatOgrenmeId, optionalMechanics: saatOgrenmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(saatOgrenmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
