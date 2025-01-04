import '../../data/repositories/ocr_repository.dart';

class PerformOcr {
  final OcrRepository ocrRepository;

  PerformOcr(this.ocrRepository);

  Future<String?> call() async {
    return await ocrRepository.performOcr();
  }
}
