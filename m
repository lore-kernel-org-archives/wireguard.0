Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A8AC47259
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F6F206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuDo9meo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F6F206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3621229a;
	Wed, 6 May 2020 10:35:20 +0000 (UTC)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7819bfd6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 16:44:08 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id t3so702591oou.8
 for <wireguard@lists.zx2c4.com>; Tue, 05 May 2020 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yw0ANHxSv30QEzun5q8pwSmZ2hCYQCfb22bWoTzOhoU=;
 b=UuDo9meo7M5hKgMQBHOQ6O/8jvbpvfFUGWoYGtH99qg1UwkbzcI19wZSAbnJD+mBma
 CmGZ7pDCkwZg8yUZF9KlJ5gjr/JTI8o5q6p6X+fdgxSMIV0SprHk6eD6ZFbpEW0MO6tw
 izevU5zzkyNI31ZkLLHmbc+Ynhy8yBwlneByZbkzKmeOO6ypRa4B3O6RXvQiaYZQM4lo
 NN9xwZ0yT/ZC4D+nqAHUx3RFzUXsVCk/Lx1ZXsHceRYirbvJGTzwH7Ud/6dEchOn98Op
 X4Gd62OzDRqBe3EeZ3a6sKo2HsYnMkG/uMGVoBzMnKW17I0nOeLtQeFmLvSsNwb8DPui
 TM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yw0ANHxSv30QEzun5q8pwSmZ2hCYQCfb22bWoTzOhoU=;
 b=IREQ3dK3H61+VUBAuoUW6Wdcw5RoErIyYR3bZ5CR+C73gFeryCNHEt9oH8fHgBx8+1
 Pjkb5V/Oe3QyGhNXC9yoSZ7Q0efMJBEr9G0vy0de4o9EaZEc3wHEpfjtc3J2Ckow9pxC
 8VqVzHg8fk8cr96F8RqB+KQ5FJ5BlnHm2W3yuSv5AYZKb5/bWW0gfIIRXgdsqOzDAXcE
 B7oJXtF2/1rE5ivliZLvOw3IE3fJH7AFH+UxsdGTzn+QlXHe2o1kE8/kduwdJWf8Z/yS
 I9HW/Czs6qJuobPyRYeXn/X5HCXd+UG3ERxC12s0/R8A8eb7TGxWOOYYXiMgFx5uLeYE
 R8jg==
X-Gm-Message-State: AGi0PuY9lgAwQPdp8Wrg1LZFl3unJmkrP+IQF3H0OKSlxnG2u8A1iDPG
 hTaP7XBT5CxIlOJODLxzYBNspltpQbtw0d//d/OBzRX30VM=
X-Google-Smtp-Source: APiQypLnGerSNe3w/EDRPPaWcdLX3WcplcKgR5S+EX9H10Zt4ojZE+h8pKmFlp2oiwDHskOhVsUICHZErHUZYUNEf3Q=
X-Received: by 2002:a4a:2fd3:: with SMTP id p202mr3767607oop.33.1588697801592; 
 Tue, 05 May 2020 09:56:41 -0700 (PDT)
MIME-Version: 1.0
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Wed, 6 May 2020 04:56:30 +1200
Message-ID: <CAF-5T9HX1_R1LcBWRZnWEvk6c-hPKxq_XYQHiTZGP7zgQjJdTw@mail.gmail.com>
Subject: wireguard: module verification failed
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 May 2020 12:35:17 +0200
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

Hi,

I just installed wireguard on two Ubuntu-18.04 instances and I'm
getting the error message below:
"wireguard: module verification failed: signature and/or required key
missing - tainting kernel"

Some research about this error say I need to recompile the system kernel.
Is that right?
Is there anything else I can do?

Thank you
