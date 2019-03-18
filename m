Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BACCC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:08:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DAE218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn8gqSMa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DAE218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0428b592;
	Sat, 23 Mar 2019 00:07:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ab93eb5
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 14:31:28 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9195b74c
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 14:31:28 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id h8so11513329pgp.6
 for <wireguard@lists.zx2c4.com>; Mon, 18 Mar 2019 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=x/llD8GS1KUHxvQnOaNlpA65HurgRGSNlGSxnG1dlpA=;
 b=Pn8gqSMashBf1jmmyYlwFyk6/qrt/H0RV5Y86KzvdExSAXngtNd04x2ooehUYOsWJx
 +xmIOx7Xmicc7ocgDolQsk4rAjiiUh1jl5Pqr3hj2BPVH9OX8Is5MH21asHTKIRHqaeg
 jHXNVWbcQIF314J1VkZd54gpXjezjxmP1bglxyWGWHou+9xAqhYer5RryYlocbrqmw/B
 hqv8KkJmYdQOqOQbaSCsNWu/fi+JjA/OnXBuoenbeOVpv0rt71gqGfYnMhdUyCRvQ4sg
 mdPLKd8/CglOWjeThuMENNx2Fq8SOQ/MuTIYr4S/ebb4ff5HL1jvati2OZNZ4rSlHk5U
 egpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=x/llD8GS1KUHxvQnOaNlpA65HurgRGSNlGSxnG1dlpA=;
 b=t/xo6i2JkNigNonqCkUz6W0gpQvCynnUlO8vvqmkWc/Ru4GQUhjjXiQgSHSY6DgVvR
 Iixhm92OyYOTCgXWMD4MeYz2Sawpzwca5xPLsWronwGY1gYKPAnDq/BZBJvuaPb/mt85
 xdNA6coanYsR7uY8G8uFbVfDhnKbXNsQemCdbAY3NVii8uyWNzk+rxFY08Qmawj+GBg4
 LW19nAp3Si0+n9dkBeduOeHTS9Y5nespLPLbqDDP3WHYy1xT+1fEbE9ibnr/Pek0jaC/
 teRqCW5oV/WZONfquS0Dte7yXaLRC+iQnEDrc8qy+mNKBpzD4SiM6q5ATOVlzIM5FQ+T
 ORag==
X-Gm-Message-State: APjAAAU6W9RR9C8OMblEztm/XFvblO8OmuKp+oYBEU1JvB3PhX2hIEft
 5SNBb9OksebN8Dljzc2UQ9j4lotNo4CUJ/FznJgRTqU01Dw=
X-Google-Smtp-Source: APXvYqwqm2crcTsic2NU3xNuvHaZsbx8LO5U1nVMzaGNBUEMQvV01CY6XIRAiZtK4XMeVEuSv5ioAdpDU3KHbZptX7Q=
X-Received: by 2002:aa7:8102:: with SMTP id b2mr16167350pfi.69.1552919489048; 
 Mon, 18 Mar 2019 07:31:29 -0700 (PDT)
MIME-Version: 1.0
From: Davide Lupo <lubboster@gmail.com>
Date: Mon, 18 Mar 2019 15:31:18 +0100
Message-ID: <CAMoj7-ZqTAn12-GurbwWm7rrTQiCL_NT0rOat_wjm3Fsi+JOUQ@mail.gmail.com>
Subject: Handshake failed: Raspberry Pi 1 + OSX Client
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:07:18 +0100
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
Content-Type: multipart/mixed; boundary="===============7317248181838943167=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7317248181838943167==
Content-Type: multipart/alternative; boundary="00000000000082731405845f3eba"

--00000000000082731405845f3eba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I've compiled and setup Wireguard for my Raspberry Pi 1 from latest TAG
WireGuard-0.0.20190227.tar.xz
<https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190227.tar.xz>

I've also installed the iOS and OSX clients.

Initially (after a couple of minutes of trials) the iOS client successfully
connected to the Server and it worked for a while until I disconnected it.

I'm trying to connect with OSX but without success.
It connects to the Wireguard server but no host are reachable on the server
network.
I can't ping the Wireguard server.

Reading the logs it seems that the client is trying to redo the handshake
every 30 seconds c.a.

Can anyone help me?

Here a small log:

2019-03-18 15:27:40.893871: [APP] startActivation: Entering (tunnel: Home)
2019-03-18 15:27:40.895666: [APP] startActivation: Starting tunnel
2019-03-18 15:27:40.899432: [APP] startActivation: Success
2019-03-18 15:27:40.905189: [APP] Tunnel 'Home' connection status changed
to 'connecting'
2019-03-18 15:27:41.057518: [NET] App version: 0.0.20190207 (3); Go backend
version: 0.0.20181222
2019-03-18 15:27:41.057881: [NET] Starting tunnel from the app
2019-03-18 15:27:45.899794: [APP] Status update notification timeout for
tunnel 'Home'. Tunnel status is now 'connecting'.
2019-03-18 15:27:46.088950: [APP] Tunnel 'Home' connection status changed
to 'connected'
2019-03-18 15:27:46.081345: [NET] Tunnel interface is utun1
2019-03-18 15:27:46.082065: [NET] Attaching to interface
2019-03-18 15:27:46.082844: [NET] Routine: encryption worker - started
2019-03-18 15:27:46.082936: [NET] Routine: decryption worker - started
2019-03-18 15:27:46.083137: [NET] Routine: decryption worker - started
2019-03-18 15:27:46.083187: [NET] Routine: handshake worker - started
2019-03-18 15:27:46.083368: [NET] Routine: encryption worker - started
2019-03-18 15:27:46.083438: [NET] Routine: decryption worker - started
2019-03-18 15:27:46.083499: [NET] Routine: handshake worker - started
2019-03-18 15:27:46.083546: [NET] Routine: encryption worker - started
2019-03-18 15:27:46.083594: [NET] Routine: decryption worker - started
2019-03-18 15:27:46.083788: [NET] Routine: handshake worker - started
2019-03-18 15:27:46.083839: [NET] Routine: encryption worker - started
2019-03-18 15:27:46.084133: [NET] Routine: handshake worker - started
2019-03-18 15:27:46.084182: [NET] Routine: TUN reader - started
2019-03-18 15:27:46.084374: [NET] Routine: event worker - started
2019-03-18 15:27:46.084490: [NET] UAPI: Updating private key
2019-03-18 15:27:46.084667: [NET] UAPI: Removing all peers
2019-03-18 15:27:46.084722: [NET] UAPI: Transition to peer configuration
2019-03-18 15:27:46.084900: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Created
2019-03-18 15:27:46.084957: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Updating =
endpoint
2019-03-18 15:27:46.085208: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Updating
persistent keepalive interval
2019-03-18 15:27:46.085259: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Removing =
all
allowedips
2019-03-18 15:27:46.085360: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Adding al=
lowedip
2019-03-18 15:27:46.085411: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Adding al=
lowedip
2019-03-18 15:27:46.085773: [NET] Routine: receive incoming IPv4 - started
2019-03-18 15:27:46.085871: [NET] Routine: receive incoming IPv6 - started
2019-03-18 15:27:46.086048: [NET] UDP bind has been updated
2019-03-18 15:27:46.086112: [NET] peer(Jn7u=E2=80=A6NMyQ) - Starting...
2019-03-18 15:27:46.086347: [NET] peer(Jn7u=E2=80=A6NMyQ) - Routine: nonce =
worker -
started
2019-03-18 15:27:46.086442: [NET] peer(Jn7u=E2=80=A6NMyQ) - Routine: sequen=
tial
receiver - started
2019-03-18 15:27:46.087540: [NET] peer(Jn7u=E2=80=A6NMyQ) - Routine: sequen=
tial
sender - started
2019-03-18 15:27:46.087781: [NET] Device started
2019-03-18 15:27:46.090861: [NET] UAPI: Processing get operation
2019-03-18 15:27:47.090178: [NET] UAPI: Processing get operation
2019-03-18 15:27:48.091227: [NET] UAPI: Processing get operation
2019-03-18 15:27:49.091311: [NET] UAPI: Processing get operation
2019-03-18 15:27:50.900640: [APP] Status update notification timeout for
tunnel 'Home'. Tunnel status is now 'connected'.
2019-03-18 15:27:50.089938: [NET] UAPI: Processing get operation
2019-03-18 15:27:50.901547: [NET] UAPI: Processing get operation
2019-03-18 15:27:51.901880: [NET] UAPI: Processing get operation
2019-03-18 15:27:52.903340: [NET] UAPI: Processing get operation
2019-03-18 15:27:53.903403: [NET] UAPI: Processing get operation
2019-03-18 15:27:54.903083: [NET] UAPI: Processing get operation
2019-03-18 15:27:55.902612: [NET] UAPI: Processing get operation
2019-03-18 15:27:56.903235: [NET] UAPI: Processing get operation
2019-03-18 15:27:57.903151: [NET] UAPI: Processing get operation
2019-03-18 15:27:58.903223: [NET] UAPI: Processing get operation
2019-03-18 15:27:59.903015: [NET] UAPI: Processing get operation
2019-03-18 15:28:00.903116: [NET] UAPI: Processing get operation
2019-03-18 15:28:01.902682: [NET] UAPI: Processing get operation
2019-03-18 15:28:02.903294: [NET] UAPI: Processing get operation
2019-03-18 15:28:03.903295: [NET] UAPI: Processing get operation
2019-03-18 15:28:04.901842: [NET] UAPI: Processing get operation
2019-03-18 15:28:05.902565: [NET] UAPI: Processing get operation
2019-03-18 15:28:06.902002: [NET] UAPI: Processing get operation
2019-03-18 15:28:07.903479: [NET] UAPI: Processing get operation
2019-03-18 15:28:08.903427: [NET] UAPI: Processing get operation
2019-03-18 15:28:09.903452: [NET] UAPI: Processing get operation
2019-03-18 15:28:10.903482: [NET] UAPI: Processing get operation
2019-03-18 15:28:11.903483: [NET] UAPI: Processing get operation
2019-03-18 15:28:12.902855: [NET] UAPI: Processing get operation
2019-03-18 15:28:13.903404: [NET] UAPI: Processing get operation
2019-03-18 15:28:14.174687: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handsha=
ke
initiation
2019-03-18 15:28:14.175233: [NET] peer(Jn7u=E2=80=A6NMyQ) - Awaiting keypai=
r
2019-03-18 15:28:14.238603: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handsh=
ake
response
2019-03-18 15:28:14.238827: [NET] peer(Jn7u=E2=80=A6NMyQ) - Obtained awaite=
d keypair
2019-03-18 15:28:14.903711: [NET] UAPI: Processing get operation
2019-03-18 15:28:15.903451: [NET] UAPI: Processing get operation
2019-03-18 15:28:16.903560: [NET] UAPI: Processing get operation
2019-03-18 15:28:17.902894: [NET] UAPI: Processing get operation
2019-03-18 15:28:18.903461: [NET] UAPI: Processing get operation
2019-03-18 15:28:19.903558: [NET] UAPI: Processing get operation
2019-03-18 15:28:20.902740: [NET] UAPI: Processing get operation
2019-03-18 15:28:21.903553: [NET] UAPI: Processing get operation
2019-03-18 15:28:22.903405: [NET] UAPI: Processing get operation
2019-03-18 15:28:23.902719: [NET] UAPI: Processing get operation
2019-03-18 15:28:24.903233: [NET] UAPI: Processing get operation
2019-03-18 15:28:25.903590: [NET] UAPI: Processing get operation
2019-03-18 15:28:26.903620: [NET] UAPI: Processing get operation
2019-03-18 15:28:27.903584: [NET] UAPI: Processing get operation
2019-03-18 15:28:28.903317: [NET] UAPI: Processing get operation
2019-03-18 15:28:29.242282: [NET] peer(Jn7u=E2=80=A6NMyQ) - Retrying handsh=
ake
because we stopped hearing back after 15 seconds
2019-03-18 15:28:29.242595: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handsha=
ke
initiation
2019-03-18 15:28:29.304797: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handsh=
ake
response
2019-03-18 15:28:29.305025: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending keepali=
ve packet
2019-03-18 15:28:29.903738: [NET] UAPI: Processing get operation
2019-03-18 15:28:30.903984: [NET] UAPI: Processing get operation
2019-03-18 15:28:31.903052: [NET] UAPI: Processing get operation
2019-03-18 15:28:32.903007: [NET] UAPI: Processing get operation
2019-03-18 15:28:33.903678: [NET] UAPI: Processing get operation
2019-03-18 15:28:34.903702: [NET] UAPI: Processing get operation
2019-03-18 15:28:35.902359: [NET] UAPI: Processing get operation
2019-03-18 15:28:36.903832: [NET] UAPI: Processing get operation
2019-03-18 15:28:37.903858: [NET] UAPI: Processing get operation
2019-03-18 15:28:38.903328: [NET] UAPI: Processing get operation
2019-03-18 15:28:39.903808: [NET] UAPI: Processing get operation
2019-03-18 15:28:40.902469: [NET] UAPI: Processing get operation
2019-03-18 15:28:41.903885: [NET] UAPI: Processing get operation
2019-03-18 15:28:42.903813: [NET] UAPI: Processing get operation
2019-03-18 15:28:43.904000: [NET] UAPI: Processing get operation
2019-03-18 15:28:44.530191: [NET] peer(Jn7u=E2=80=A6NMyQ) - Retrying handsh=
ake
because we stopped hearing back after 15 seconds
2019-03-18 15:28:44.530393: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handsha=
ke
initiation
2019-03-18 15:28:44.638109: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handsh=
ake
response
2019-03-18 15:28:44.638385: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending keepali=
ve packet
2019-03-18 15:28:44.904022: [NET] UAPI: Processing get operation
2019-03-18 15:28:45.903517: [NET] UAPI: Processing get operation
2019-03-18 15:28:46.902685: [NET] UAPI: Processing get operation
2019-03-18 15:28:47.903926: [NET] UAPI: Processing get operation
2019-03-18 15:28:48.904012: [NET] UAPI: Processing get operation
2019-03-18 15:28:49.903955: [NET] UAPI: Processing get operation
2019-03-18 15:28:50.903954: [NET] UAPI: Processing get operation
2019-03-18 15:28:51.903501: [NET] UAPI: Processing get operation
2019-03-18 15:28:52.904089: [NET] UAPI: Processing get operation
2019-03-18 15:28:53.903264: [NET] UAPI: Processing get operation
2019-03-18 15:28:54.903677: [NET] UAPI: Processing get operation
2019-03-18 15:28:55.904018: [NET] UAPI: Processing get operation
2019-03-18 15:28:56.904046: [NET] UAPI: Processing get operation
2019-03-18 15:28:57.903917: [NET] UAPI: Processing get operation
2019-03-18 15:28:58.904210: [NET] UAPI: Processing get operation
2019-03-18 15:28:59.904100: [NET] UAPI: Processing get operation
2019-03-18 15:29:00.903223: [NET] UAPI: Processing get operation
2019-03-18 15:29:01.904237: [NET] UAPI: Processing get operation
2019-03-18 15:29:02.904200: [NET] UAPI: Processing get operation
2019-03-18 15:29:03.903027: [NET] UAPI: Processing get operation
2019-03-18 15:29:04.904611: [NET] UAPI: Processing get operation
2019-03-18 15:29:05.904266: [NET] UAPI: Processing get operation
2019-03-18 15:29:06.904536: [NET] UAPI: Processing get operation
2019-03-18 15:29:07.904704: [NET] UAPI: Processing get operation
2019-03-18 15:29:08.904274: [NET] UAPI: Processing get operation
2019-03-18 15:29:09.904260: [NET] UAPI: Processing get operation
2019-03-18 15:29:10.904390: [NET] UAPI: Processing get operation
2019-03-18 15:29:11.904284: [NET] UAPI: Processing get operation
2019-03-18 15:29:12.576313: [NET] peer(Jn7u=E2=80=A6NMyQ) - Retrying handsh=
ake
because we stopped hearing back after 15 seconds
2019-03-18 15:29:12.576571: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handsha=
ke
initiation
2019-03-18 15:29:12.641026: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handsh=
ake
response
2019-03-18 15:29:12.641247: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending keepali=
ve packet
2019-03-18 15:29:12.903576: [NET] UAPI: Processing get operation
2019-03-18 15:29:13.904330: [NET] UAPI: Processing get operation
2019-03-18 15:29:14.904637: [NET] UAPI: Processing get operation
2019-03-18 15:29:15.904786: [NET] UAPI: Processing get operation
2019-03-18 15:29:16.904425: [NET] UAPI: Processing get operation
2019-03-18 15:29:17.904134: [NET] UAPI: Processing get operation
2019-03-18 15:29:18.903013: [NET] UAPI: Processing get operation
2019-03-18 15:29:19.904375: [NET] UAPI: Processing get operation
2019-03-18 15:29:20.904409: [NET] UAPI: Processing get operation
2019-03-18 15:29:21.903868: [NET] UAPI: Processing get operation
2019-03-18 15:29:22.904661: [NET] UAPI: Processing get operation
2019-03-18 15:29:23.904433: [NET] UAPI: Processing get operation
2019-03-18 15:29:24.904902: [NET] UAPI: Processing get operation
2019-03-18 15:29:25.904439: [NET] UAPI: Processing get operation
2019-03-18 15:29:26.904510: [NET] UAPI: Processing get operation
2019-03-18 15:29:27.904106: [NET] UAPI: Processing get operation
2019-03-18 15:29:28.904306: [NET] UAPI: Processing get operation
2019-03-18 15:29:29.408556: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handsh=
ake
initiation
2019-03-18 15:29:29.408640: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handsha=
ke
response
2019-03-18 15:29:29.957942: [NET] UAPI: Processing get operation
2019-03-18 15:29:30.903840: [NET] UAPI: Processing get operation
2019-03-18 15:29:31.903158: [NET] UAPI: Processing get operation
2019-03-18 15:29:32.904597: [NET] UAPI: Processing get operation
2019-03-18 15:29:33.904647: [NET] UAPI: Processing get operation
2019-03-18 15:29:34.904590: [NET] UAPI: Processing get operation
2019-03-18 15:29:35.904163: [NET] UAPI: Processing get operation

--00000000000082731405845f3eba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
 All,</div><div><br></div><div>I&#39;ve compiled and setup Wireguard for my=
 Raspberry Pi 1 from latest TAG=C2=A0</div><div><a href=3D"https://git.zx2c=
4.com/WireGuard/snapshot/WireGuard-0.0.20190227.tar.xz">WireGuard-0.0.20190=
227.tar.xz</a><br></div><div><br></div><div>I&#39;ve also installed the iOS=
 and OSX clients.</div><div><br></div><div>Initially (after a couple of min=
utes of trials) the iOS client successfully connected to the Server and it =
worked for a while until I disconnected it.</div><div><br></div><div>I&#39;=
m trying to connect with OSX but without success.</div><div>It connects to =
the Wireguard server but no host are reachable on the server network.</div>=
<div>I can&#39;t ping the Wireguard server.</div><div><br></div><div>Readin=
g the logs it seems that the client is trying to redo the handshake every 3=
0 seconds c.a.</div><div><br></div><div>Can anyone help me?</div><div><br><=
/div><div>Here a small log:</div><div><br></div><div><div>2019-03-18 15:27:=
40.893871: [APP] startActivation: Entering (tunnel: Home)</div><div>2019-03=
-18 15:27:40.895666: [APP] startActivation: Starting tunnel</div><div>2019-=
03-18 15:27:40.899432: [APP] startActivation: Success</div><div>2019-03-18 =
15:27:40.905189: [APP] Tunnel &#39;Home&#39; connection status changed to &=
#39;connecting&#39;</div><div>2019-03-18 15:27:41.057518: [NET] App version=
: 0.0.20190207 (3); Go backend version: 0.0.20181222</div><div>2019-03-18 1=
5:27:41.057881: [NET] Starting tunnel from the app</div><div>2019-03-18 15:=
27:45.899794: [APP] Status update notification timeout for tunnel &#39;Home=
&#39;. Tunnel status is now &#39;connecting&#39;.</div><div>2019-03-18 15:2=
7:46.088950: [APP] Tunnel &#39;Home&#39; connection status changed to &#39;=
connected&#39;</div><div>2019-03-18 15:27:46.081345: [NET] Tunnel interface=
 is utun1</div><div>2019-03-18 15:27:46.082065: [NET] Attaching to interfac=
e</div><div>2019-03-18 15:27:46.082844: [NET] Routine: encryption worker - =
started</div><div>2019-03-18 15:27:46.082936: [NET] Routine: decryption wor=
ker - started</div><div>2019-03-18 15:27:46.083137: [NET] Routine: decrypti=
on worker - started</div><div>2019-03-18 15:27:46.083187: [NET] Routine: ha=
ndshake worker - started</div><div>2019-03-18 15:27:46.083368: [NET] Routin=
e: encryption worker - started</div><div>2019-03-18 15:27:46.083438: [NET] =
Routine: decryption worker - started</div><div>2019-03-18 15:27:46.083499: =
[NET] Routine: handshake worker - started</div><div>2019-03-18 15:27:46.083=
546: [NET] Routine: encryption worker - started</div><div>2019-03-18 15:27:=
46.083594: [NET] Routine: decryption worker - started</div><div>2019-03-18 =
15:27:46.083788: [NET] Routine: handshake worker - started</div><div>2019-0=
3-18 15:27:46.083839: [NET] Routine: encryption worker - started</div><div>=
2019-03-18 15:27:46.084133: [NET] Routine: handshake worker - started</div>=
<div>2019-03-18 15:27:46.084182: [NET] Routine: TUN reader - started</div><=
div>2019-03-18 15:27:46.084374: [NET] Routine: event worker - started</div>=
<div>2019-03-18 15:27:46.084490: [NET] UAPI: Updating private key</div><div=
>2019-03-18 15:27:46.084667: [NET] UAPI: Removing all peers</div><div>2019-=
03-18 15:27:46.084722: [NET] UAPI: Transition to peer configuration</div><d=
iv>2019-03-18 15:27:46.084900: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Create=
d</div><div>2019-03-18 15:27:46.084957: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAP=
I: Updating endpoint</div><div>2019-03-18 15:27:46.085208: [NET] peer(Jn7u=
=E2=80=A6NMyQ) - UAPI: Updating persistent keepalive interval</div><div>201=
9-03-18 15:27:46.085259: [NET] peer(Jn7u=E2=80=A6NMyQ) - UAPI: Removing all=
 allowedips</div><div>2019-03-18 15:27:46.085360: [NET] peer(Jn7u=E2=80=A6N=
MyQ) - UAPI: Adding allowedip</div><div>2019-03-18 15:27:46.085411: [NET] p=
eer(Jn7u=E2=80=A6NMyQ) - UAPI: Adding allowedip</div><div>2019-03-18 15:27:=
46.085773: [NET] Routine: receive incoming IPv4 - started</div><div>2019-03=
-18 15:27:46.085871: [NET] Routine: receive incoming IPv6 - started</div><d=
iv>2019-03-18 15:27:46.086048: [NET] UDP bind has been updated</div><div>20=
19-03-18 15:27:46.086112: [NET] peer(Jn7u=E2=80=A6NMyQ) - Starting...</div>=
<div>2019-03-18 15:27:46.086347: [NET] peer(Jn7u=E2=80=A6NMyQ) - Routine: n=
once worker - started</div><div>2019-03-18 15:27:46.086442: [NET] peer(Jn7u=
=E2=80=A6NMyQ) - Routine: sequential receiver - started</div><div>2019-03-1=
8 15:27:46.087540: [NET] peer(Jn7u=E2=80=A6NMyQ) - Routine: sequential send=
er - started</div><div>2019-03-18 15:27:46.087781: [NET] Device started</di=
v><div>2019-03-18 15:27:46.090861: [NET] UAPI: Processing get operation</di=
v><div>2019-03-18 15:27:47.090178: [NET] UAPI: Processing get operation</di=
v><div>2019-03-18 15:27:48.091227: [NET] UAPI: Processing get operation</di=
v><div>2019-03-18 15:27:49.091311: [NET] UAPI: Processing get operation</di=
v><div>2019-03-18 15:27:50.900640: [APP] Status update notification timeout=
 for tunnel &#39;Home&#39;. Tunnel status is now &#39;connected&#39;.</div>=
<div>2019-03-18 15:27:50.089938: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:50.901547: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:51.901880: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:52.903340: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:53.903403: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:54.903083: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:55.902612: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:56.903235: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:57.903151: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:58.903223: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:27:59.903015: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:00.903116: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:01.902682: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:02.903294: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:03.903295: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:04.901842: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:05.902565: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:06.902002: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:07.903479: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:08.903427: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:09.903452: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:10.903482: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:11.903483: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:12.902855: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:13.903404: [NET] UAPI: Processing get operation</div>=
<div>2019-03-18 15:28:14.174687: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending ha=
ndshake initiation</div><div>2019-03-18 15:28:14.175233: [NET] peer(Jn7u=E2=
=80=A6NMyQ) - Awaiting keypair</div><div>2019-03-18 15:28:14.238603: [NET] =
peer(Jn7u=E2=80=A6NMyQ) - Received handshake response</div><div>2019-03-18 =
15:28:14.238827: [NET] peer(Jn7u=E2=80=A6NMyQ) - Obtained awaited keypair</=
div><div>2019-03-18 15:28:14.903711: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:15.903451: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:16.903560: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:17.902894: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:18.903461: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:19.903558: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:20.902740: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:21.903553: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:22.903405: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:23.902719: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:24.903233: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:25.903590: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:26.903620: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:27.903584: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:28.903317: [NET] UAPI: Processing get operation</=
div><div>2019-03-18 15:28:29.242282: [NET] peer(Jn7u=E2=80=A6NMyQ) - Retryi=
ng handshake because we stopped hearing back after 15 seconds</div><div>201=
9-03-18 15:28:29.242595: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handshake =
initiation</div><div>2019-03-18 15:28:29.304797: [NET] peer(Jn7u=E2=80=A6NM=
yQ) - Received handshake response</div><div>2019-03-18 15:28:29.305025: [NE=
T] peer(Jn7u=E2=80=A6NMyQ) - Sending keepalive packet</div><div>2019-03-18 =
15:28:29.903738: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:30.903984: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:31.903052: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:32.903007: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:33.903678: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:34.903702: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:35.902359: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:36.903832: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:37.903858: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:38.903328: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:39.903808: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:40.902469: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:41.903885: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:42.903813: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:43.904000: [NET] UAPI: Processing get operation</div><div>2019-03-18 =
15:28:44.530191: [NET] peer(Jn7u=E2=80=A6NMyQ) - Retrying handshake because=
 we stopped hearing back after 15 seconds</div><div>2019-03-18 15:28:44.530=
393: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handshake initiation</div><div=
>2019-03-18 15:28:44.638109: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received hands=
hake response</div><div>2019-03-18 15:28:44.638385: [NET] peer(Jn7u=E2=80=
=A6NMyQ) - Sending keepalive packet</div><div>2019-03-18 15:28:44.904022: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:45.903517: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:46.902685: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:47.903926: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:48.904012: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:49.903955: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:50.903954: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:51.903501: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:52.904089: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:53.903264: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:54.903677: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:55.904018: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:56.904046: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:57.903917: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:58.904210: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:28:59.904100: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:00.903223: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:01.904237: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:02.904200: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:03.903027: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:04.904611: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:05.904266: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:06.904536: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:07.904704: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:08.904274: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:09.904260: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:10.904390: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:11.904284: [=
NET] UAPI: Processing get operation</div><div>2019-03-18 15:29:12.576313: [=
NET] peer(Jn7u=E2=80=A6NMyQ) - Retrying handshake because we stopped hearin=
g back after 15 seconds</div><div>2019-03-18 15:29:12.576571: [NET] peer(Jn=
7u=E2=80=A6NMyQ) - Sending handshake initiation</div><div>2019-03-18 15:29:=
12.641026: [NET] peer(Jn7u=E2=80=A6NMyQ) - Received handshake response</div=
><div>2019-03-18 15:29:12.641247: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending k=
eepalive packet</div><div>2019-03-18 15:29:12.903576: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:13.904330: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:14.904637: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:15.904786: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:16.904425: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:17.904134: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:18.903013: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:19.904375: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:20.904409: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:21.903868: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:22.904661: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:23.904433: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:24.904902: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:25.904439: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:26.904510: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:27.904106: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:28.904306: [NET] UAPI: Processin=
g get operation</div><div>2019-03-18 15:29:29.408556: [NET] peer(Jn7u=E2=80=
=A6NMyQ) - Received handshake initiation</div><div>2019-03-18 15:29:29.4086=
40: [NET] peer(Jn7u=E2=80=A6NMyQ) - Sending handshake response</div><div>20=
19-03-18 15:29:29.957942: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:30.903840: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:31.903158: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:32.904597: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:33.904647: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:34.904590: [NET] UAPI: Processing get operation</div><div>20=
19-03-18 15:29:35.904163: [NET] UAPI: Processing get operation</div></div><=
div><br></div></div></div></div></div>

--00000000000082731405845f3eba--

--===============7317248181838943167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7317248181838943167==--
