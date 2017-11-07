Return-Path: k@vodka.home.kg
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 923e4dbb
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:38:07 +0000 (UTC)
Received: from mail.kotidze.in (mail.kotidze.in [185.203.117.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5de428c6
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:38:06 +0000 (UTC)
Date: Tue, 7 Nov 2017 12:41:14 +0300
From: k@vodka.home.kg
Message-ID: <845371988.20171107124114@vodka.home.kg>
To: wireguard@lists.zx2c4.com
Subject: parallel crypto leads to performance degradation
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I posted about this problem month ago but nobody replied.
This  summer WIREGUARD_PARALLEL option was removed and parallel crypto
became unconditional.
This  seems  to slow performance 1.5 times on slow 1 core systems such
as routers. Task switch eats cpu time.
Do you have plans to mitigate this slowdown or return option to skip
pcrypto ?


wireguard: WireGuard 0.0.20170517 loaded. See www.wireguard.io for information.

[  3]  0.0- 1.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3]  1.0- 2.0 sec  3.62 MBytes  30.4 Mbits/sec
[  3]  2.0- 3.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3]  3.0- 4.0 sec  3.38 MBytes  28.3 Mbits/sec
[  3]  4.0- 5.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3]  5.0- 6.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3]  6.0- 7.0 sec  3.75 MBytes  31.5 Mbits/sec
[  3]  7.0- 8.0 sec  3.88 MBytes  32.5 Mbits/sec
[  3]  8.0- 9.0 sec  4.00 MBytes  33.6 Mbits/sec
[  3]  9.0-10.0 sec  4.25 MBytes  35.7 Mbits/sec

CPU:   1% usr   0% sys   0% nic   6% idle   0% io   0% irq  90% sirq


    16.03%  [wireguard]       [k] chacha20_generic_block                 
     7.66%  [wireguard]       [k] poly1305_generic_blocks                
     3.61%  [ip_tables]       [k] ipt_do_table                           
     3.05%  [kernel]          [k] crypto_xor                             
     3.03%  [kernel]          [k] csum_partial                           
     2.66%  [kernel]          [k] __copy_user_common                     
     1.23%  [kernel]          [k] nf_iterate                             
     1.07%  [nf_conntrack]    [k] __nf_conntrack_find_get                
     0.91%  [kernel]          [k] fib_table_lookup                       
     0.89%  [kernel]          [k] __bzero                                
     0.88%  [kernel]          [k] r4k_blast_dcache_page_dc32             
     0.85%  [kernel]          [k] __netif_receive_skb_core               
     0.85%  [kernel]          [k] ag71xx_poll                            
     0.85%  [kernel]          [k] do_ade                                 
     0.82%  [kernel]          [k] get_page_from_freelist                 
     0.71%  [kernel]          [k] ip_rcv                 



wireguard: WireGuard 0.0.20170918 loaded. See www.wireguard.com for information.

[  3]  0.0- 1.0 sec  2.62 MBytes  22.0 Mbits/sec
[  3]  1.0- 2.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  2.0- 3.0 sec  2.25 MBytes  18.9 Mbits/sec
[  3]  3.0- 4.0 sec  2.12 MBytes  17.8 Mbits/sec
[  3]  4.0- 5.0 sec  2.25 MBytes  18.9 Mbits/sec
[  3]  5.0- 6.0 sec  2.50 MBytes  21.0 Mbits/sec
[  3]  6.0- 7.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  7.0- 8.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  8.0- 9.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  9.0-10.0 sec  2.75 MBytes  23.1 Mbits/sec
[  3]  0.0-10.0 sec  25.6 MBytes  21.4 Mbits/sec

CPU:   1% usr  54% sys   0% nic   0% idle   0% io   0% irq  44% sirq


     6.84%  [wireguard]     [k] chacha20_generic_block                 
     3.46%  [wireguard]     [k] poly1305_generic_blocks                
     3.12%  [kernel]        [k] finish_task_switch                     
     2.80%  [ip_tables]     [k] ipt_do_table                           
     2.30%  [kernel]        [k] __copy_user_common                     
     2.23%  [kernel]        [k] queue_work_on                          
     1.73%  [kernel]        [k] ag71xx_poll                            
     1.46%  [kernel]        [k] __dev_queue_xmit                       
     1.35%  [kernel]        [k] crypto_xor                             
     1.31%  [kernel]        [k] csum_partial                           
     1.25%  [kernel]        [k] __do_softirq                           
     1.14%  [kernel]        [k] ag71xx_hard_start_xmit                 
     1.10%  [nf_conntrack]  [k] __nf_conntrack_find_get         
