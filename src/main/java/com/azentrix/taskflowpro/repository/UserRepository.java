package com.azentrix.taskflowpro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.azentrix.taskflowpro.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

}