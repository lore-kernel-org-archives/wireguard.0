Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cfad94a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 10:53:02 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b64d756b
 for <wireguard@lists.zx2c4.com>; Fri, 6 Oct 2017 10:53:02 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id C5D07132EA63
 for <wireguard@lists.zx2c4.com>; Fri,  6 Oct 2017 13:22:15 +0200 (CEST)
Date: Fri, 06 Oct 2017 11:22:15 +0000
Message-ID: <20171006112215.Horde.PVbxF1OCC2ugTFVlOcX22n3@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Subject: Re: netns.sh: Sending cookie response for denied handshake
In-Reply-To: <20171006105940.Horde.-YgH3Xzem0aIzxlyFy3xGun@www.vdorst.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Also WireGuard 0.0.20171001 has it.


[root@cubox tests]# ./netns.sh
[+] ip netns add wg-test-863-0
[+] ip netns add wg-test-863-1
[+] ip netns add wg-test-863-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[  172.621122] wireguard: loading out-of-tree module taints kernel.
[  172.628391] wireguard: module verification failed: signature and/or  
required                                                                
                                               key missing - tainting  
kernel
[  172.642541] wireguard: routing table self-tests: pass
[  172.650545] wireguard: nonce counter self-tests: pass
[  172.660875] wireguard: curve25519 self-tests: pass
[  172.665806] wireguard: chacha20poly1305 self-tests: pass
[  172.673951] wireguard: blake2s self-tests: pass
[  173.014255] wireguard: ratelimiter self-tests: pass
[  173.019415] wireguard: WireGuard 0.0.20171001 loaded. See  
www.wireguard.com f                                                     
                                                         or information.
[  173.027933] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c                                                             
                                                 4.com>. All Rights  
Reserved.
[  173.040380] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-863-1
[+] NS0: ip link add dev wg0 type wireguard
[  173.128583] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-863-2
[+] wg genkey
[+] wg genkey
[+] wg pubkey
[+] wg pubkey
[+] wg genpsk
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS1: ip addr add fd00::1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS2: ip addr add fd00::2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer  
xU8gpc+t5m8/Aa7+Vs                                                      
                                                         
JXj/U7yS05L3+5ffVxLOOuWDw= preshared-key /dev/fd/62 allowed-ips  
192.168.241.2/32                                                        
                                                      ,fd00::2/128
[  173.412056] wireguard: wg0: Peer 1 created
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
XdjZJkqTsFnVFO/gHW                                                      
                                                         
Hf6Xqribof8bHd2BeFUZAjA2Y= preshared-key /dev/fd/62 allowed-ips  
192.168.241.1/32                                                        
                                                      ,fd00::1/128
[  173.457206] wireguard: wg0: Peer 2 created
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer xU8gpc+t5m8/Aa7+VsJXj/U7yS05L3+5ffVxLOOuWDw=  
endpoint 1                                                              
                                                27.0.0.1:2
[+] NS2: wg set wg0 peer XdjZJkqTsFnVFO/gHWHf6Xqribof8bHd2BeFUZAjA2Y=  
endpoint 1                                                              
                                                27.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
.[  173.687604] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.                                                               
                                               1:1)
[  173.689508] wireguard: wg0: Sending cookie response for denied  
handshake mess                                                          
                                                    age for 127.0.0.1:2
[  173.689608] wireguard: wg0: Receiving cookie response from 127.0.0.1:1
.........
--- 192.168.241.1 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 98ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[  174.898691] wireguard: wg0: Peer 1 (127.0.0.1:2) destroyed
[  174.908717] wireguard: wg0: Interface deleted
[+] NS2: ip link del dev wg0
[  174.960702] wireguard: wg0: Peer 2 (127.0.0.1:1) destroyed
[  174.982706] wireguard: wg0: Interface deleted
[+] ip netns del wg-test-863-1
[+] ip netns del wg-test-863-2
[+] ip netns del wg-test-863-0
[root@cubox tests]#
[+] ip netns add wg-test-863-2
[+] NS0: ip link set up dev lo
[+] NS0: ip link add dev wg0 type wireguard
[  172.621122] wireguard: loading out-of-tree module taints kernel.
[  172.628391] wireguard: module verification failed: signature and/or  
required key missing - tainting kernel
[  172.642541] wireguard: routing table self-tests: pass
[  172.650545] wireguard: nonce counter self-tests: pass
[  172.660875] wireguard: curve25519 self-tests: pass
[  172.665806] wireguard: chacha20poly1305 self-tests: pass
[  172.673951] wireguard: blake2s self-tests: pass
[  173.014255] wireguard: ratelimiter self-tests: pass
[  173.019415] wireguard: WireGuard 0.0.20171001 loaded. See  
www.wireguard.com for information.
[  173.027933] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld  
<Jason@zx2c4.com>. All Rights Reserved.
[  173.040380] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-863-1
[+] NS0: ip link add dev wg0 type wireguard
[  173.128583] wireguard: wg0: Interface created
[+] NS0: ip link set wg0 netns wg-test-863-2
[+] wg genkey
[+] wg genkey
[+] wg pubkey
[+] wg pubkey
[+] wg genpsk
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS1: ip addr add fd00::1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS2: ip addr add fd00::2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer  
xU8gpc+t5m8/Aa7+VsJXj/U7yS05L3+5ffVxLOOuWDw= preshared-key /dev/fd/62  
allowed-ips 192.168.241.2/32,fd00::2/128
[  173.412056] wireguard: wg0: Peer 1 created
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer  
XdjZJkqTsFnVFO/gHWHf6Xqribof8bHd2BeFUZAjA2Y= preshared-key /dev/fd/62  
allowed-ips 192.168.241.1/32,fd00::1/128
[  173.457206] wireguard: wg0: Peer 2 created
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link show dev wg0
[+] NS1: wg set wg0 peer xU8gpc+t5m8/Aa7+VsJXj/U7yS05L3+5ffVxLOOuWDw=  
endpoint 127.0.0.1:2
[+] NS2: wg set wg0 peer XdjZJkqTsFnVFO/gHWHf6Xqribof8bHd2BeFUZAjA2Y=  
endpoint 127.0.0.1:1
[+] NS2: ping -c 10 -f -W 1 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
.[  173.687604] wireguard: wg0: Sending handshake initiation to peer 2  
(127.0.0.1:1)
[  173.689508] wireguard: wg0: Sending cookie response for denied  
handshake message for 127.0.0.1:2
[  173.689608] wireguard: wg0: Receiving cookie response from 127.0.0.1:1
.........
--- 192.168.241.1 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 98ms

[+] NS0: ip link del dev wg0
[+] NS1: ip link del dev wg0
[  174.898691] wireguard: wg0: Peer 1 (127.0.0.1:2) destroyed
[  174.908717] wireguard: wg0: Interface deleted
[+] NS2: ip link del dev wg0
[  174.960702] wireguard: wg0: Peer 2 (127.0.0.1:1) destroyed
[  174.982706] wireguard: wg0: Interface deleted
[+] ip netns del wg-test-863-1
[+] ip netns del wg-test-863-2
[+] ip netns del wg-test-863-0
