package bema.debeziumdemo.siparis.siparis.controller;

import bema.debeziumdemo.siparis.siparis.controller.dto.SiparisDto;
import bema.debeziumdemo.siparis.siparis.service.SiparisService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/siparis")
public class SiparisCommandController {

  private final SiparisService siparisService;

  public SiparisCommandController(SiparisService siparisService) {
    this.siparisService = siparisService;
  }

  @PostMapping
  public String createSiparis(@RequestBody SiparisDto siparisDto) {
    return siparisService.saveSiparis(siparisDto);
  }

}
