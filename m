Return-Path: <SRS0=uYrD=F2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3F6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 15:34:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0352311D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 15:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0352311D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0af30ebf;
	Tue, 22 Dec 2020 15:25:03 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6698b814
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Dec 2020 10:07:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w5so13950346wrm.11
 for <wireguard@lists.zx2c4.com>; Tue, 22 Dec 2020 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=wjKta0sUVFAT3RzjOOljW1slQxREFEnNxjFG9r772SY=;
 b=CUaf7mqvTxQ/7BF+M8VDiXsSBv+3vuZwraC0Ko/C2s4n0mubucoimMrLaXs0dS3w1C
 Qt0FHoiP+q7/zAY60MMlBkuMRjTPXsmPmFZM9Yzn+X04q55JYToPgp9bAcTDY4DO3Pp9
 S+efOskmGFRXrU8YhIplaESjU9vu99O2B/nqYBD/DAtF24p4heVuIG+I5gP1Y1r7r1zB
 n7tRoGnwKQtoZivtgtIjXnrvyaECuyvga6cQGn/9pLJZXIjb7+bOXfzNhSFI8ecsTofn
 mDb4CviWx7MLnYb6DpvcDVaNNp4Q+CUEQIGvIJaMQ/KjaJeS1uQ8PkzDRkyTrFc1R2oG
 RszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=wjKta0sUVFAT3RzjOOljW1slQxREFEnNxjFG9r772SY=;
 b=Ekwu6l5ADzBTsV6M98JNPsqfyDwxDm6PpIpvcBww3kuAr1lUJrjy4Pzue9/pDwp7TW
 IYJjCGE/gJ5uyGlGDLmik+E7d1SOMfwCUqQrhH7Cr3+c4gM7EbDPkcxq8+rwgxm8MjhK
 emxlHm25yElc79g8T4f7yLt71BVIUgmH/zpcftw87m6yFH2RtgjtuTnbgjL+5TX7MkqT
 wMpnwZmJHaca4qst6NiAN6xcOTUWPXydWv8DAKydJOj/8rceoyqu5QfFZ/daBJYCn+T6
 fOhw0lPm2g2AG1lOGsCTnox2ynMFvObdK005eDs6vEI1hEhIjSnXAGqNUeTyvMI6hI3F
 0Nqg==
X-Gm-Message-State: AOAM531nuMI1i0VOIF/R3HrUsM2xz+6w6L1IsWXfR2y54gR6oNmQkuJD
 nEbMtCzMqMXIMC85AYdb/dCahlIgLu3cnErOZ8CD8v4GpE6ST5dKOSLBfOQz3HSE+j+Dy6KfEPj
 aI+EuxmxOrT4CLXQn8qnCfQpPaotFPgRKFquevBjweARnPBUZGo1VgH5OIjM9wTXJGKWe569AEk
 RIzF40gPUU
X-Google-Smtp-Source: ABdhPJw2TlmFuxBbXcd2ODMoRdLzQIFw8g/InaRszk4uodhnnZCNF8oeROx+fas/R6KIhzdMo4DDoQ==
X-Received: by 2002:adf:e802:: with SMTP id o2mr23789913wrm.251.1608632186700; 
 Tue, 22 Dec 2020 02:16:26 -0800 (PST)
Received: from ?IPv6:fddd:dddd:1000:0:86a6:50cd:aa63:4ea2?
 (ec2-18-130-213-235.eu-west-2.compute.amazonaws.com. [18.130.213.235])
 by smtp.gmail.com with ESMTPSA id z3sm31491368wrn.59.2020.12.22.02.16.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 02:16:26 -0800 (PST)
From: Laura Zelenku <laura.zelenku@wandera.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Handshake state collision between parralel RoutineHandshake threads
Message-Id: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
Date: Tue, 22 Dec 2020 11:16:24 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Dec 2020 16:24:59 +0100
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

Hello devs,
I=E2=80=99m getting errors "handshake initiation must be consumed first=E2=
=80=9D caused by handshake state is not set to HandshakeInitiationConsumed =
when processing handshake initiation from a peer. The handshake state is ch=
anged between =E2=80=9CConsumeMessageInitiation=E2=80=9D and =E2=80=9CCreat=
eMessageResponse=E2=80=9D by processing handshake response from the same pe=
er in different thread.
You know, UDP packet can be delayed or lost mainly from mobile devices with=
 worse mobile signal. After some time (handshake timeout) the peer that ini=
tiated connection doesn=E2=80=99t send any handshake (handshake is not deli=
vered) to other side, the other side starts to send its own handshake initi=
ation requests. And now there are both sides sending handshakes.

In a log I=E2=80=99ve found =E2=80=9CReceived handshake response=E2=80=9D, =
=E2=80=9CReceived handshake initiation=E2=80=9D and =E2=80=9CFailed to crea=
te response message=E2=80=9D on the same time (ms).

Proposals:
1) lower log level of "handshake initiation must be consumed first=E2=80=9D
2) start only one RoutineHandshake (not based on nr. of CPUs)
3) extend critical section over whole MessageInitiation processing

thanks and I=E2=80=99m looking forward for following discussions
Laura
--=20
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching=20
hereto are confidential and intended exclusively for the person to whom the=
=20
email is addressed. If you are not the intended recipient, do not read,=20
copy, disclose or use the contents in any way. Wandera accepts no liability=
=20
for any loss, damage or consequence resulting directly or indirectly from=
=20
the use of this email and attachments.
