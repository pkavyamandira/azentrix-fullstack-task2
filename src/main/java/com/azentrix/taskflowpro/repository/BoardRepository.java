package com.azentrix.taskflowpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.azentrix.taskflowpro.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Long> {

}