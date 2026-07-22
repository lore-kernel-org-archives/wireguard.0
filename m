Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E199CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6097cdc1;
	Mon, 5 Oct 2026 06:56:28 +0000 (UTC)
Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch
 [109.224.244.24])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 29c7c995
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2026 09:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1784713087; x=1784972287;
 bh=EQ+Mr3p1i9ZU/C8tNVSejNjDGk/e5MGdVh6yLSAZqqQ=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=WEG3uiFwUaA22HLxy9WCPeLu3yHzKelqewOJ8axtXKGrX9bEfXqIXIL0M+lOPx1Qm
 5j4SGD8mNCCe01sEhbkzuXpMcBbGrrF2RhPYGklJ3Yz1N+2RojC6QyrWHCzYKD8KKA
 nFRN5Kw5guKXpABpHYHDu3fAAlwr9d9/UDinANeHjKYcxtSHNF1B1tgfBxu2ttCn+W
 6n5LOy1nlHXIL0kxY5viKL43eJmxXE+4o+PGlHrG5BdNpZukb59zcsNLzjoXViz3nt
 7moshcZy+wNZdK63R08/NLph8r8w/Nj/Dsv2vqc3BW0sQdIGtA0oG9iHJ10ZDOTH5l
 DjqchQLDtqkgg==
Date: Wed, 22 Jul 2026 09:38:05 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Markus Pischinger <makupi@proton.me>
Subject: wireguard-go: Windows winrio receive exits on ICMP unreachable
Message-ID: <0YrBtS_pOagP-VBw5XRdiFC02Z7p9ZHF0803NKsVMkSV8ghWy-Qr5Xi3CUBALADA1tm7OkoQgpRtdCLwqw9EeK5xpOXyp83wiSctBFYuWug=@proton.me>
Feedback-ID: 210736943:user:proton
X-Pm-Message-ID: 6686ebd76e41be49edfe76f9ed3c0f06936eab1a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

Hey everyone,

I've noticed an issue with the wireguard-go Windows implementation, specifi=
cally winrio and its handling of ICMP errors.=C2=A0
The default behaviour for Go is to disable SIO_UDP_CONNRESET [1] and SIO_UD=
P_NETRESET [2], but since the winrio implementation creates the socket dire=
ctly via WSASocket rather than going through Go's net package, those flags =
are never disabled.
This results in ICMP unreachable being received as an error, and bind_windo=
ws.go just wraps it as windows.Errno [3], which is a non-temporary error. S=
o in=C2=A0RoutineReceiveIncoming [4], if it receives this error, it just re=
turns, leaving the receive path of wireguard-go broken, while the rest stil=
l runs as if nothing happened. In this state wireguard-go will continuously=
 try to initiate a handshake every 5 seconds, and even if the peer answers,=
 it will never receive the response.=C2=A0


This is fixed by disabling both SIO_UDP_CONNRESET and=C2=A0SIO_UDP_NETRESET=
,=C2=A0similar to how Go does it in src/net/fd_windows.go [5].

I can provide a patch if necessary, but I wanted to verify that there isn't=
 a reason those flags aren't disabled.

Thanks,
Markus Pischinger


[1]=C2=A0https://github.com/golang/go/issues/5834
[2]=C2=A0https://github.com/golang/go/issues/68614
[3]=C2=A0https://github.com/WireGuard/wireguard-go/blob/ecfc5a8d54462e18e13=
c72173e2623d16d8e25a0/conn/bind_windows.go#L410-L412
[4]=C2=A0https://github.com/WireGuard/wireguard-go/blob/ecfc5a8d54462e18e13=
c72173e2623d16d8e25a0/device/receive.go#L116-L118
[5]=C2=A0https://go.googlesource.com/go/+/be79f939834898d38a7827ed6ebd52182=
3ac3499/src/net/fd_windows.go#60
