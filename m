Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0BECA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:48:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7ac52e2b;
	Mon, 5 Oct 2026 06:56:40 +0000 (UTC)
Received: from sender5-23.zohomail360.com (sender5-23.zohomail360.com
 [165.173.183.23])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 749f9fd5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Sep 2026 16:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1790266897; cv=none; 
 d=zohomail360.com; s=zohoarc; 
 b=ANlCSoIMgNLwUgznFZ1pFdCCuQY9kMQ03fhKmV3WfEPdQ09h/axX6DuiqME3mrnQnqvYBnBj2o9B79+128ld0l+g28xTs8f/q9dt0lauwzBrNfcNgDg/gakYlSTf17PZVvPqk14IZso8585ZtOn8l0uwu/2JbKPcYPMTbWLoaOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail360.com;
 s=zohoarc; t=1790266897;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=VIM2h/Nw8iMkzr39slI3jodsKH1jgYFlHF1lpIEsvbk=; 
 b=LmYlTcMdFqUIu4IcuAARv3/Csm0m39DHbaiYWpEcbBOOPNMPxK54wEBtdSyyppJnoIg822TSUcf3ZsSuvERs8lpcT0fw11lnWLcAxX6rYTKoDNxVNi870x7Z2WyPIaiNIHiqjEfKwn01ITsd04GSkDZqGrKhysUp9qlo+el5tvI=
ARC-Authentication-Results: i=1; mx.zohomail360.com;
 dkim=pass  header.i=kearnsapuya.com; spf=pass
 smtp.mailfrom=alex+039e1d20-b834-11f1-b1cb-525400b938ca_vt1@bounce-zem.kearnsapuya.com;
 dmarc=pass header.from=<alex@kearnsapuya.com>
Received: by mx.zohomail.com with SMTPS id 179026689653157.555827195809115;
 Thu, 24 Sep 2026 09:21:36 -0700 (PDT)
DKIM-Signature: a=rsa-sha256;
 b=bZr5WMzFxXTE4c2jEoceM9V2PxWW5C7b1KrIZPAvuxLOh8OH0XI9G+Kf+KHXKso8X/35B+Y/Qx6iVslC/FPphFsmMr+eHULEylQGCFBNalpbq9TWo7wlihEDxfEaAqaLVGuUC/z1LKlWO808E6ds/IhAPYV1EENZtW5qti1Lc2A=;
 c=relaxed/relaxed; s=1613290; d=kearnsapuya.com; v=1;
 bh=VIM2h/Nw8iMkzr39slI3jodsKH1jgYFlHF1lpIEsvbk=;
 h=date:from:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:to:message-id:subject;
Date: Thu, 24 Sep 2026 09:21:36 -0700 (PDT)
From: Alex Kearns-Apuya <alex@kearnsapuya.com>
To: wireguard@lists.zx2c4.com
Message-ID: <2d6f.6f3e213e1d9e4196.m1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2@bounce-zem.kearnsapuya.com>
Subject: [PATCH] wg-quick: darwin: ignore pending SIGALRM during monitor
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
x-mailer-Orig: git-send-email 2.54.0
content-type-Orig: text/plain; charset=UTF-8
Original-Envelope-Id: 2d6f.6f3e213e1d9e4196.m1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2
X-JID: 2d6f.6f3e213e1d9e4196.s1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2
TM-MAIL-JID: 2d6f.6f3e213e1d9e4196.m1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2
X-App-Message-ID: 2d6f.6f3e213e1d9e4196.m1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2
X-Report-Abuse: <abuse+2d6f.6f3e213e1d9e4196.m1.039e1d20-b834-11f1-b1cb-525400b938ca.1a0d438eff2@zohocpaas.com>
Feedback-ID: zu08091227db577258ef384bc8f921b9b70000db4fb8e24df282317e1033815b13ce9b63d0dd8d086122722d:ZohoMail
X-Zoho-CM-AccountID: e58b24a837dc60ac52e9f28201bacf27eed6979607e9f1a02ffeb038a30e60b0
X-ZohoMailClient: External
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

When DNS is configured, the route monitor subshell traps ALRM to
set_dns and, after every route event it handles, schedules
`sleep 2 && kill -ALRM $bpid` in the background. Its INT/TERM/EXIT trap
runs del_routes and del_dns but never disarms the ALRM handler, so if
the monitor handled a route event in the two seconds before teardown
(removing the interface generates route events of its own), the pending
ALRM is delivered while del_dns is restoring the network services.
set_dns then runs from the trap and re-pins every service to the
tunnel's DNS servers, leaving them pinned after the interface is gone.

Observed on macOS 27.2 with Homebrew wireguard-tools (the same code is
at current master) and a config with a DNS=3D line, sampling the
SystemConfiguration preferences at 10 Hz during `wg-quick down`: pinned
services went 6 -> 1 as del_dns ran, then back to 6 in set_dns order,
and 5 stayed pinned after the teardown finished. It reproduced on 1 of
2 controlled downs, plus one unprompted occurrence, and does not depend
on how `down` is invoked.

Ignore ALRM first thing in the exit trap. Resetting it with
`trap - ALRM` is not enough: SIGALRM's default action terminates the
subshell, which would abort the restore instead. With this change, 6 of
6 up/down cycles restored DNS, with the monitor still lingering
1.2-5.4 s past the interface teardown each time (the triggering
condition).

Configs without DNS=3D never install the ALRM trap and are unaffected.

Signed-off-by: Alex Kearns-Apuya <alex@kearnsapuya.com>
---
 src/wg-quick/darwin.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index 0179afb..20a21ce 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -323,7 +323,7 @@ del_dns() {
=20
 monitor_daemon() {
 =09echo "[+] Backgrounding route monitor" >&2
-=09(trap 'del_routes; del_dns; exit 0' INT TERM EXIT
+=09(trap 'trap "" ALRM; del_routes; del_dns; exit 0' INT TERM EXIT
 =09exec >/dev/null 2>&1
 =09exec 19< <(exec route -n monitor)
 =09local event bpid=3D$BASHPID mpid=3D$!
--=20
2.54.0 (Apple Git-157)

