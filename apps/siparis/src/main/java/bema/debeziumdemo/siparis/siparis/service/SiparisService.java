package bema.debeziumdemo.siparis.siparis.service;

import bema.debeziumdemo.siparis.siparis.controller.dto.SiparisDto;
import bema.debeziumdemo.siparis.siparis.repository.SiparisRepository;
import bema.debeziumdemo.siparis.siparis.repository.entity.Siparis;
import org.springframework.stereotype.Service;

import java.util.UUID;


@Service
public class SiparisService {

  private final SiparisRepository siparisRepository;

  public SiparisService(SiparisRepository siparisRepository) {
    this.siparisRepository = siparisRepository;
  }

  public String saveSiparis(SiparisDto siparisDto) {
    var siparisId = UUID.randomUUID().toString();
    var siparis = new Siparis(UUID.randomUUID(), UUID.randomUUID(), siparisDto.musteriId());

    siparisRepository.save(siparis);
    return "Başarıyla kaydedildi: " + siparisId;
  }
}
