Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333EC04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:20:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c47c104e;
	Wed, 28 Sep 2022 10:20:53 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 75deab59
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Sep 2022 13:50:07 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-346cd4c3d7aso74777167b3.8
 for <wireguard@lists.zx2c4.com>; Thu, 08 Sep 2022 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=VbNYCuViF91bHieZPfmgFlmfCB8wGk+PuccxGUmXrQ8=;
 b=eRdxzeBb4u/H4dAcI3xUp9WX5jSRjEafssKLkCk/8kFk6XpAEU7Na0epFDZ7AxV4Mk
 Gx9UF/EHdv0Wo0GN92kNgD7ZrmiUJNjLzmf6Jj5gb91cn78ruIzRTYF+g3DGPX9jsQXo
 H1PF/JtYA0PHzx4qSIgvs8IOm3y+De9ZWvbsR4JaVI6oRJtSIKbsRCK7UC9Af2IxO1lY
 DQqrwOAwGKHTFgtY/Fz8m6bPlsLU6KmsD3Z8ZJgUBGSpc1cnA0ia+kccb5MsGMJbgi5W
 4EaBmT7C8qGTP4L7VDN4x632XSDDWy4l5klQk5ItPNGQmV3mJWJWqOyCJjWlA32Q6ZMT
 jmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=VbNYCuViF91bHieZPfmgFlmfCB8wGk+PuccxGUmXrQ8=;
 b=sb/08GzJNIuE/hVxQECTgdL+O024eWvItNMrK+2tRuG71endg51Vs/G71tCNPCbIQ2
 EBCLCDXztiFQ4NDYVh/TCKWd3+DeeCHc3qu1pwKwfcklw1qqmQ437QvoHUcBtTlAsKmM
 QekeUvbCOHTSsLwvghKENazBWCXtGJ8ACRnSrs5whmANIkUx0DcLcFfVU7AEH6KWKRCC
 FgAfc8ES5+b6rEDBu3XuEnV7MMFzhORcuLzOPOpusZNNgNLmFLVKfw3TjIVuqGFywkn7
 N5INd+znqiITijFzjR0Fli03d8IlBxJy93AuL7qO0CH7mgQSvZ2VrCK5ORGjkTUPVUSs
 oGuQ==
X-Gm-Message-State: ACgBeo2mDwZaJmzXDQAtgKEqV3l8NzlU6mzCbqjOUNsez2MFhzutNy7N
 5P3t0scj60D5hfr8hfiiYbWxoJnq0buz8QXlqn0csSRWrJs=
X-Google-Smtp-Source: AA6agR63HpHQIUDsoBBnqGvBeaBr6x+o+jQdW5WZhYAGn/9mj0UMaA5xpwJ/8RG0Bd6GxWasA6PD6ljDJsmfJp54osw=
X-Received: by 2002:a81:46c2:0:b0:341:a26e:9d9b with SMTP id
 t185-20020a8146c2000000b00341a26e9d9bmr7407304ywa.336.1662645006210; Thu, 08
 Sep 2022 06:50:06 -0700 (PDT)
MIME-Version: 1.0
From: Michael Brookes <mgsb81@gmail.com>
Date: Thu, 8 Sep 2022 14:49:55 +0100
Message-ID: <CABfcST-uzN3JJ0vB04s4TSfSbz18Ngn9pn+41iN_g62XWoAtUw@mail.gmail.com>
Subject: Constant stream of handshake for peer did not complete
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
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

Hi

I have one wg endpoint which is CentOS 7.9.2009
(3.10.0-1160.71.1.el7.x86_64) with kmod-wireguard
9:1.0.20220627-1.el7_9.elrepo installed. Has about 300ish peers.

We have one, there could be more, cases of wireguard logging on the
other peer (typically laptops, I've seen this happen on Mac using the
app and Ubuntu)

Handshake for peer 6 ... did not complete after 5 seconds, retrying (try 4)

The handshake on the CentOS end never updates and of course the tunnel
doesn't work on the Mac/Ubuntu laptop.

To get the tunnel working again all I do is on the CentOS end remove
and add the peer, and the tunnel suddenly springs to life and traffic
flows normally.

I've since enabled debug on the CentOS end and see a constant stream of:

Handshake for peer 6 ... did not complete after 5 seconds, retrying (try 4)

Since I enabled debugging ~200 different peers have logged that.
Also see this - invalid address - a few times too for different peers:

Handshake for peer 1809 ((invalid address)) did not complete after 5
seconds, retrying (try 5)

Is this expected debug output for a setup where you have a CentOS
server with peers which are all laptops? i.e. the CentOS end is trying
to initiate the handshake and the laptop is off/wireguard app turned
off.

Is it down to some UDP traffic potentially being dropped? Some network
card tweaks needed?

Any help greatly appreciated
