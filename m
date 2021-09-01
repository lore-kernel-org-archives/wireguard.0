Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EF0C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 17:46:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA19861027
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 17:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA19861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37cdcdb6;
	Wed, 1 Sep 2021 17:44:52 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ffa7d02
 for <wireguard@lists.zx2c4.com>; Wed, 1 Sep 2021 17:44:48 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 0DA5460818BE
 for <wireguard@lists.zx2c4.com>; Wed,  1 Sep 2021 19:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630518288; bh=RNh7Gp771j0UIVc8f/6xdFjqdN4+Xv4xJdbmq1TY+Qs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=LYUJhjg0vSAv0Y33d+OG8qBoyJyYvG5P9SZJA5X9JI7aW04gY7qyZg65N7AcoZKDm
 P4czVl8qj+lMVnf2yfAqvmSjZKJfzwT/txLyunfZqc9C2LdmGfdTf875wpoSfmFULo
 11gEbAfdKwfyQSYeUxRrrSO4RmAdQ/xtCuzbL/RI=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id C52286081880
 for <wireguard@lists.zx2c4.com>; Wed,  1 Sep 2021 19:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630518287; bh=RNh7Gp771j0UIVc8f/6xdFjqdN4+Xv4xJdbmq1TY+Qs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=f6o8jieTnfWw0DmkxRxWlVL4AnME81/iZTyjBs7T+6jLUmzHoZDT7VKDGQhXDdfJB
 T4mvBPYtL93LLtJ9hFgO7Oy2VxJHpuFLmgAAJXOMFAQxXDKsmihzHzZlC7nxvRzOzf
 MxNCJkb/xJ+DWtSykmayMzTlIVrx98owEXoMe/fY=
Subject: Re: ipv6 connexion fail - ipv4 OK
To: wireguard@lists.zx2c4.com
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
 <20210827211412.3ed5f170@natsu>
 <3ec547c6-c846-e5be-e276-ace7862f5cb7@tootai.net>
 <34d4341c-98be-b754-af8e-c7097bc21aac@pineview.net>
 <20210828024454.1766744f@natsu>
 <7437f3e0-26ba-5e33-a175-0cf233635b3f@tootai.net>
 <20210830214312.6a332333@natsu>
 <e620ed11-2664-fa06-1497-a0f18facac7e@tootai.net>
 <20210830223836.5384badd@natsu>
 <e949b3e2-eab7-fc4c-2b15-8820a2c17374@tootai.net>
 <20210830225927.6df90edb@natsu>
 <d7095107-050f-2075-00cb-fdaa86d6daf5@tootai.net>
From: Daniel <tech@tootai.net>
Message-ID: <eda71620-a941-e2c1-b7b3-bdc67d53e72b@tootai.net>
Date: Wed, 1 Sep 2021 19:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d7095107-050f-2075-00cb-fdaa86d6daf5@tootai.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Again :)

Le 31/08/2021 à 19:50, Daniel a écrit :
> Hi
>
> Le 30/08/2021 à 19:59, Roman Mamedov a écrit :
>> On Mon, 30 Aug 2021 19:44:21 +0200
>> Daniel <tech@tootai.net> wrote:
>>
>>>> Do you get WG working at all, between some other two hosts (not 
>>>> involving this
>>>> particular server for now)?
>>> Yes. Clients are shown on both sides as connected, trafic seems to go
>>> out on each side but other one as received near to nothing.
>> I mean not just "shown as connected", but have you got actual traffic 
>> working
>> between any two hosts. Even just forgetting this server for a while. 
>> So that
>> you can rule out some general issue and concentrate on just the 
>> particular
>> machine setup.
>
> I went a step further. Server has a /64 on eth0, his address being 
> .1/64 Interface I gave to wireguard is called wigserver and get .a2/64 
> as address when up. Now I start the client which is a .24/64 while 
> tcpdump -ni any udp and port 38194 is running on the server. Output is
>
> 19:28:45.790295 eth0  In  IP6 2001:db8:16e:10::24.50012 > 
> 2001:db8:c2c:7c50::a2.38194: UDP, length 148
> 19:28:45.790629 eth0  Out IP6 2001:db8:c2c:7c50::a2.38194 > 
> 2001:db8:16e:10::24.50012: UDP, length 92
> 19:29:06.572059 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
> 2001:db8:16e:10::24.50012: UDP, length 148
> 19:29:11.947969 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
> 2001:db8:16e:10::24.50012: UDP, length 148
> 19:29:17.324065 eth0  Out IP6 2001:db8:c2c:7c50::1.38194 > 
> 2001:db8:16e:10::24.50012: UDP, length 148
>
> As you can see, the original request is going to the right IP which 
> respond with the right source IP (line 1 and 2) From here, all packets 
> are going out with the IP of eth0 not the one from wigserver which is 
> .a2/64. The client has "allowed ips = 10.99.98.0/27, ::/0"
>
> Remember, no FW involved. Before this test I bring up interfaces 
> without wireguard configuration and did server/client test like nc -lu 
> IP PORT on the server while on the client I used nc -u IP PORT 
> Everything worked well. I also started the client while server was not 
> running and got the ICMP6 respons "unreachable port" sended to the 
> client. I also tried to tell to the client to connect to the .1/64 
> insteed of the .a2/64, didn't work
>
> If someone had an idea on what's going on here, would be helpful ;)

I continue my investigations and modify client to connect to eth0 ipv6 
address .1/64 as well that I set debug using # modprobe wireguard && 
echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control 
command. I get the same result that when I connect to the .a2/64 IP 
address from the wireguard server.

Clearly, the first step seems to go well as I see

Sep  1 19:00:51 kirsch kernel: [ 3597.830187] wireguard: wigserver: 
Receiving handshake initiation from peer 1 ([2001:db8:16e:10::24]:42602/0%0)
Sep  1 19:00:51 kirsch kernel: [ 3597.830193] wireguard: wigserver: 
Sending handshake response to peer 1 ([2001:db8:16e:10::24]:42602/0%0)
Sep  1 19:00:51 kirsch kernel: [ 3597.830487] wireguard: wigserver: 
Keypair 1 created for peer 1

but then appear the problem, server did not receive the answer and try 
again and again and again. Please note that it tell 5s but it is in the 
same second or so.

Sep  1 19:00:52 kirsch kernel: [ 3599.369652] wireguard: wigserver: 
Handshake for peer 1 ([2001:db8:16e:10::24]:42602/0%0) did not complete 
after 5 seconds, r
etrying (try 13)

On the client, the answer is sended with the newly ipv6 address from the 
wireguard interface to the ipv6 address of the server wireguard interface

19:00:57.309251 IP6 2001:db8:c2c:7c50::24.42602 > 
2001:db8:c2c:7c50::1.38194: UDP, length 148

and this too, again and again and again.

Hints ?

Thanks for your support

-- 
Daniel
