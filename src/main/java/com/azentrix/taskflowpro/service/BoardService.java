package com.azentrix.taskflowpro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.azentrix.taskflowpro.entity.Board;
import com.azentrix.taskflowpro.repository.BoardRepository;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    public Board saveBoard(Board board) {
        return boardRepository.save(board);
    }

    public List<Board> getAllBoards() {
        return boardRepository.findAll();
    }

    public void deleteBoard(Long id) {
        boardRepository.deleteById(id);
    }
}