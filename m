Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA53C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 00:00:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 162C12082F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 00:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mindcast.org header.i=@mindcast.org header.b="UWaK+fES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 162C12082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mindcast.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15b81994;
	Sun, 9 Dec 2018 23:52:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f137632
 for <wireguard@lists.zx2c4.com>; Sun, 9 Dec 2018 18:38:48 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f1fefee
 for <wireguard@lists.zx2c4.com>; Sun, 9 Dec 2018 18:38:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id n18-v6so7645792lji.7
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mindcast.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=3DYEMKTmooEyhW9eDCQUdPIqnFZFZYDVgGa17NHNkL8=;
 b=UWaK+fESfBK48RnemVp/FVJcfpF4a7XslIj5lRFtDSIsWRpBNFJ48kLv8UCHw0uxjb
 yXslFO+aREZEPgRKMUKM1dODtUOcIIaGHv9oT1KTFpXjR8c5Su1ooMdA7Ob2wpz8A6EU
 +KF5Jotqj1FnE6T8uQaYb8oJnmv/1kBVM38ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3DYEMKTmooEyhW9eDCQUdPIqnFZFZYDVgGa17NHNkL8=;
 b=fjPv/u//Eyv8rhylsSiZD+K5G9ANI2x+aiaybn5Ky7ttt7jsncPtMfq/SUBbJSTydX
 2Kwa12GVoKInzAeCaCYXqWGubJIlp5J9PXQr37MxdrZBSzzSDvua97dt3gEOLPuWsAnr
 h8+G3zyhyraoMBrOQMWvIPj+3xGMok4MWDxwrZVB1jVtlAn194EE14kdx5rKYdzQc8sf
 W9mdqHm6bed3jxpdHc5he9e959Ea7Aw5MuyqDdtn+lvu1uCU8AOdbJCpY9Vknb1J+nf/
 MZCSdrqodWpEDIUT81tNBA2qoNestWoR5ox3NqwZpn0Z9O4psxlBsVCuaroDLPMYXeT0
 qYHA==
X-Gm-Message-State: AA+aEWawq0m+N7RZ69d6Mu59jgoS3eqjQj3bvwII83yMPwj6kgj4yr68
 +VlQOjhP7KAffTdOWWZuovRsPhWYzE38vhOCCH+Lr8UhLpQ=
X-Google-Smtp-Source: AFSGD/WudH98nxNGYWVk1ZqDbeuH7RPF2aF+WjAE2QLX9FXoFQWHQY3ZNYctUKywYv/lW2TJ+bvNU0VjMuLy7Fd94tQ=
X-Received: by 2002:a2e:8605:: with SMTP id
 a5-v6mr5415618lji.145.1544381240920; 
 Sun, 09 Dec 2018 10:47:20 -0800 (PST)
MIME-Version: 1.0
From: "Berk D. Demir" <bdd@mindcast.org>
Date: Sun, 9 Dec 2018 10:46:54 -0800
Message-ID: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
Subject: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 10 Dec 2018 00:52:01 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I'm running WireGuard Android on ChromeOS with its Android subsystem
support. It was working without any significant issues up until
Android runtime got updated to 9 (Pie) with a Dev Channel update.
WireGuard started to crash right after starting a connection.

Looking at the logs, I can see libwg-go.so's attempt to use
`inotify_init` (x86_64 system call #253) is blocked by seccomp,
crashing the process with SIGSYS. I'm guessing this is where libwg
hits the seccomp filter:
https://github.com/WireGuard/wireguard-go/blob/1c025570139f614f2083b935e2c58d5dbf199c2f/uapi_linux.go#L91

Is this a known new enforcement in Android 9? ...or I wonder if this
is particular to Android runtime under (/along with?) ChromeOS.

I'm running Chrome 72.0.3626.8 (Dev Channel) on a Google Pixelbook
(CrOS code name: eve) with the latest WireGuard from Play Store.

Relevant portion of the logs are below. I'd gladly collect more data
if someone can instruct me to get more than wireguard logs or looking
at /var/log/arc.log.


== wireguard.log excerpt ==
12-09 09:53:56.270  2254  2271 D WireGuard/GoBackend: Changing tunnel
[[redact: peer host]] to state UP
12-09 09:53:56.270  2254  2271 I WireGuard/GoBackend: Bringing tunnel up
12-09 09:53:56.270  2254  2271 D WireGuard/GoBackend: Requesting to
start VpnService
12-09 09:53:56.550  2254  2271 D WireGuard/GoBackend: Go backend v0.0.20181018
12-09 09:53:56.551  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: Debug log enabled
12-09 09:53:56.551  2254  2271 I WireGuard/GoBackend/[[redact: peer
host]]: Attaching to interface tun0
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: event worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: encryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: decryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: handshake worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: encryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: decryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: handshake worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: encryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: decryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: handshake worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: encryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: decryption worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: handshake worker - started
12-09 09:53:56.578  2254  2277 D WireGuard/GoBackend/[[redact: peer
host]]: Routine: TUN reader - started
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: Interface has MTU 1280
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: UAPI: Updating private key
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: UAPI: Removing all peers
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: UAPI: Transition to peer configuration
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: peer([[redact: peer PK]]) - UAPI: Created
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: peer([[redact: peer PK]]) - UAPI: Adding allowedip
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: peer([[redact: peer PK]]) - UAPI: Updating endpoint
12-09 09:53:56.578  2254  2271 D WireGuard/GoBackend/[[redact: peer
host]]: peer([[redact: peer PK]]) - UAPI: Updating persistent
keepalive interva
12-09 09:53:56.579  2254  2271 F libc    : Fatal signal 31 (SIGSYS),
code 1 (SYS_SECCOMP) in tid 2271 (AsyncTask #2), pid 2254
(reguard.android)
12-09 09:53:56.595  2346  2346 E cutils-trace: Error opening trace
file: Permission denied (13)
12-09 09:53:56.625  2348  2348 I crash_dump64: obtaining output fd
from tombstoned, type: kDebuggerdTombstone
12-09 09:53:56.625  2348  2348 I crash_dump64: performing dump of
process 2254 (target tid = 2271)
12-09 09:53:56.631  2348  2348 F DEBUG   : *** *** *** *** *** *** ***
*** *** *** *** *** *** *** *** ***
12-09 09:53:56.631  2348  2348 F DEBUG   : Build fingerprint:
'google/eve/eve_cheets:9/R72-11316.6.0/5164505:user/release-keys'
12-09 09:53:56.631  2348  2348 F DEBUG   : Revision: '0'
12-09 09:53:56.631  2348  2348 F DEBUG   : ABI: 'x86_64'
12-09 09:53:56.631  2348  2348 F DEBUG   : pid: 2254, tid: 2271, name:
AsyncTask #2  >>> com.wireguard.android <<<
12-09 09:53:56.631  2348  2348 F DEBUG   : signal 31 (SIGSYS), code 1
(SYS_SECCOMP), fault addr --------
12-09 09:53:56.631  2348  2348 F DEBUG   : Cause: seccomp prevented
call to disallowed x86_64 system call 253
12-09 09:53:56.631  2348  2348 F DEBUG   :     rax 00000000000000fd
rbx 000000000000003a  rcx 000079379735049b  rdx 0000000000000000
12-09 09:53:56.631  2348  2348 F DEBUG   :     r8  0000000000000000
r9  0000000000000000  r10 0000000000000000  r11 0000000000000202
12-09 09:53:56.631  2348  2348 F DEBUG   :     r12 0000000000000000
r13 000000000000000c  r14 000000000000000b  r15 0000000000000080
12-09 09:53:56.631  2348  2348 F DEBUG   :     rdi 0000000000000000
rsi 0000000000000000
12-09 09:53:56.631  2348  2348 F DEBUG   :     rbp 000000c000ae7b20
rsp 000000c000ae7ad8  rip 000079379735049b
12-09 09:53:56.631  2348  2348 F DEBUG   :
12-09 09:53:56.631  2348  2348 F DEBUG   : backtrace:
12-09 09:53:56.631  2348  2348 F DEBUG   :     #00 pc 000000000014649b
 /data/app/com.wireguard.android-EkzFeozwwuPX-vLJCT75-Q==/lib/x86_64/libwg-go.so
12-09 09:53:56.887  2348  2348 E crash_dump64: unable to connect to
activity manager: Permission denied
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
