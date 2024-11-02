package bema.debeziumdemo.siparis.siparis.repository.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;


@Entity
@Table(name = "siparis")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Siparis {
  @Id
  @Column(name = "id")
  private UUID id;

  private UUID siparisId;
  private UUID musteriId;
}
