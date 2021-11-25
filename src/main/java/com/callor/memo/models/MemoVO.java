package com.callor.memo.models;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
@Table(name="tbl_memo")
public class MemoVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long m_seq;

    @Column(name = "m_author", columnDefinition = "VARCHAR(25)")
    private String m_author;

    @Column(name = "m_date", columnDefinition = "VARCHAR(10)")
    private String m_date;

    @Column(name = "m_time", columnDefinition = "VARCHAR(10)")
    private String m_time;

    @Column(name = "m_memo", columnDefinition = "VARCHAR(40)")
    private String m_memo;

    @Column(name = "m_image", columnDefinition = "VARCHAR(125)")
    private String m_image;

    // List<FileDTO> fileList;
}