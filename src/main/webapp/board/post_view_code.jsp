<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>

    <div id="wrapped">
        <div class="board-type">
            <p>게시판 종류</p>
        </div>
        <div class="post">
            <div class="user-bigbox">
                <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                <div class="user-box">
                    <div class="user">
                        <p>익명</p>
                        <p>10분전</p>
                    </div>
                </div>
            </div> 
            
            <h3>출력은 잘 나오는데 계속 채점이 안되네요</h3>
            <p class="post-content">
                testcase들은 다 통과하는데 채점에서 뭐가 문제인지 알려주시면 감사하겠습니다.
            </p>
            <pre><code class="language-java codebox">import java.io.*;
import java.util.*;
public class BJ26142 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        int[] D = new int[N];
        long[] H = new long[N];
        for (int i = 0; i < N; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            D[i] = Integer.parseInt(st.nextToken());
            H[i] = Long.parseLong(st.nextToken());
        }
        long[] heights = new long[N];
        for (int i = 0; i < N; i++) {
            heights[i] = H[i];
        }
                
        long cumulativeSum = 0;
        for (int k = 1; k <= N; k++) {
        // 현재 높이를 기준으로 maxHeap 초기화
            PriorityQueue<Long> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
            for (int i = 0; i < N; i++) {
                maxHeap.add(heights[i]);
            }
                
            // 도둑이 최대 높이의 드래곤을 쏘는 경우
            long maxCut = maxHeap.poll();
            cumulativeSum += maxCut;
            System.out.println(cumulativeSum);
            // maxCut 높이를 가진 드래곤 찾기
            for (int i = 0; i < N; i++) {
                if (heights[i] == maxCut) {
                    heights[i] = 0; // 높이를 0으로 설정
                    break;
                }
            }
            // heights 배열을 내림차순으로 정렬하여 다음 날을 준비
            Long[] heightsWrapper = Arrays.stream(heights).boxed().toArray(Long[]::new);
            Arrays.sort(heightsWrapper, Collections.reverseOrder());
            heights = Arrays.stream(heightsWrapper).mapToLong(Long::longValue).toArray();
                
            // 모든 드래곤의 키를 D[i]만큼 증가
            for (int i = 0; i < N; i++) {
                heights[i] += D[i];
            }
        }
        br.close();
    }
}</code></pre>
            <div class="post-info">
                <span class="icon" >
                    <span class="material-symbols-outlined" style="font-size:18px;">
                        visibility
                        </span>
                </span>
                <span class="num">2000</span>
                <span class="icon" >
                    <span class="material-symbols-outlined" style="font-size:18px;">
                        thumb_up
                        </span>
                </span>
                <span class="num">2</span>
                <span class="icon" >
                    <span class="material-symbols-outlined" style="font-size:18px;">
                        chat
                        </span>
                </span>
                <span class="num">2</span>
            </div>
        </div> 
        <div class="comment-bigbox">
            <span class="comment-input">
                <input type="text"></input>
                <button><span class="material-symbols-outlined" style="font-size:18px;"> edit</span></button>
            </span>
            <div class="comment-box">
                <div class="comment">
                    <div class="user-bigbox">
                        <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                        <div class="user-box">
                            <div class="user">
                                <p>익명</p>
                                <p>10분전</p>
                            </div>
                        </div>
                    </div>
                    <p class="comment-content">
                        가가가가가가가가각
                    </p>
                </div>

                <div class="comment reply">
                    <div class="user-bigbox">
                        <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                        <div class="user-box">
                            <div class="user">
                                <p>익명 <span>작성자</span></p>
                                <p>10분전</p>
                            </div>
                        </div>
                    </div>
                    <p class="comment-content">
                        나나나나나나나나나나나나나나나나나나나나나나나
                    </p>
                </div>
                <div class="comment reply">
                    <div class="user-bigbox">
                        <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                        <div class="user-box">
                            <div class="user">
                                <p>익명 <span>작성자</span></p>
                                <p>10분전</p>
                            </div>
                        </div>
                    </div>
                    <p class="comment-content">
                        나나나나나나나나나나나나나나나나나나나나나나나
                    </p>
                </div>
                <div class="comment">
                    <div class="user-bigbox">
                        <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                        <div class="user-box">
                            <div class="user">
                                <p>익명</p>
                                <p>10분전</p>
                            </div>
                        </div>
                    </div>
                    <p class="comment-content">
                        가가가가가가가가가                    
                    </p>
                </div>
                <div class="comment">
                    <div class="user-bigbox">
                        <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                        <div class="user-box">
                            <div class="user">
                                <p>익명</p>
                                <p>10분전</p>
                            </div>
                        </div>
                    </div>
                    <p class="comment-content">
                        가가가가가가가가가
                    </p>
                </div>

            </div>
        </div>
    </div>


<%@ include file="../include/footer.jsp" %>
