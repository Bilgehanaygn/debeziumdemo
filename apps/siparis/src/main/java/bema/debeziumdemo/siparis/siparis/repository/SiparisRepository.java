package bema.debeziumdemo.siparis.siparis.repository;

import bema.debeziumdemo.siparis.siparis.repository.entity.Siparis;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SiparisRepository extends JpaRepository<Siparis, UUID> {
}
