package com.dkmo.todolist.todolist.users;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UsersRepository extends JpaRepository<Users,UUID>{
public Users findByUsername(String username);
}
