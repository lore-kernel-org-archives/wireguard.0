Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF9AC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E097360F14
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E097360F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6444a023;
	Sun, 5 Sep 2021 11:12:54 +0000 (UTC)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4972a5f8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 16:41:24 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so7251148otf.2
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4eGRpzKxlBhD4P2oL8nIhRJosYMqID1v/2RUNrovjeM=;
 b=dQas8ERJY4kFnXvw2GfLn/0WQ4c3L8vL081WwBNUrXgoEcoMusyG5qPy1OylJYKt7D
 1EFjh/6KseOF/Sc/5NivgKtiFP5yoZPw1Qofhyh4pZ407COn27AWRgp4bH3b9DnUHVqa
 100j79SpIlZ/HT2CzJglmTt+k7/M2znfnnATh8YppyW0olVlm/Tg38KGnrC+BSvt4Yys
 dP1F3pwsUXs3Gmq9Kdxvp8owZs0Ktogh9uo3E4QfAofpEKovAjcEEgMK7pJSTS1npRWz
 L5ByuWsjWbUx3moY59v3Gb5IWfWArCad8Swb8FUUw9zXbGdm05Dh4zNfrbXlYApS/J3t
 xmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4eGRpzKxlBhD4P2oL8nIhRJosYMqID1v/2RUNrovjeM=;
 b=rMF2YTr6Duz2FQsr0fArvbFLmZ15jZu7bLDbjErbn2BASOq0MuuxxoPByzLfhZ71Zd
 XEUQ5xxYQnCInLN8GCq99xFeXCHGpYwnCCS5xSzV/KCx38gBkqvBLJtwEROODED+ESbl
 Y3lpQVCh+DZ/7AqTd2qgY4VL7vcjbN/u2w6MGhjOX7RyOqL//kLCsJSButLgyvXuzyZy
 NF9Y3IgjJ9M/s5M64MejxFLzUXUn8QOgSeVEo3Z+CYI1dyxrgHZwDXko1Gxpwfnj9XdS
 lK0Nv8XKi13x9FPA8K7NL49F83jNRI98sIZtrb06RQ4V5qvV/dxTlweh1QWuEw69mFfy
 TwMQ==
X-Gm-Message-State: AOAM530uknOZTbfwpDc2af52c0OHeOX0W+xwWwwTW07u3raBSEwnvrAX
 rQ/XzRRLmSrWsDNoOD9KOIbJkNhmfEapNtIxRiifLuuhYgve3w==
X-Google-Smtp-Source: ABdhPJw9SYVYa9jRYuKDkkKpoOyZgd6y6G3HSIbFf16gH+nf1zstwixeoA37z+Uo/DRVqIQmHXAR1wiZavcswGd8eNA=
X-Received: by 2002:a05:6830:314b:: with SMTP id
 c11mr4005443ots.169.1630687283459; 
 Fri, 03 Sep 2021 09:41:23 -0700 (PDT)
MIME-Version: 1.0
From: David Ventura <davidventura27@gmail.com>
Date: Fri, 3 Sep 2021 18:41:12 +0200
Message-ID: <CA+UPfZ7bqKdff147=trSRWGGhbCg8VP2WHePWFT8JYZD3YarHg@mail.gmail.com>
Subject: Wireguard-go behavior on network-interface change
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Sep 2021 11:12:49 +0000
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
I am running wireguard-go on linux (as a fallback for no kernel
modules available on some devices, that is being worked on in
parallel) and hitting an unexpected issue:

When a mobile device changes network, the interfaces (or an unknown,
to me, part of the network stack) are temporarily unavailable.
Depending on the timing of these changes, sometimes wireguard-go will
shut down and sometimes it will time-out for up to 15 seconds and
recover:

Recovery-1:
DEBUG: (wg0) 2021/09/03 18:13:35 peer(B3D6=E2=80=A6YQVk) - Sending keepaliv=
e packet
ERROR: (wg0) 2021/09/03 18:13:35 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
DEBUG: (wg0) 2021/09/03 18:13:41 peer(B3D6=E2=80=A6YQVk) - Received handsha=
ke initiation

Recovery-2:
DEBUG: (wg0) 2021/09/03 18:13:57 peer(B3D6=E2=80=A6YQVk) - Sending keepaliv=
e packet
ERROR: (wg0) 2021/09/03 18:14:11 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:12 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:13 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:14 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:15 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:16 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:17 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
ERROR: (wg0) 2021/09/03 18:14:18 peer(B3D6=E2=80=A6YQVk) - Failed to send d=
ata
packet network is unreachable
DEBUG: (wg0) 2021/09/03 18:14:31 peer(B3D6=E2=80=A6YQVk) - Sending keepaliv=
e packet
DEBUG: (wg0) 2021/09/03 18:15:41 peer(B3D6=E2=80=A6YQVk) - Received handsha=
ke initiation

Recovery-3:
DEBUG: (wg0) 2021/09/03 18:16:06 peer(B3D6=E2=80=A6YQVk) - Sending keepaliv=
e packet
DEBUG: (wg0) 2021/09/03 18:16:24 peer(B3D6=E2=80=A6YQVk) - Retrying handsha=
ke
because we stopped hearing back after 15 seconds
DEBUG: (wg0) 2021/09/03 18:16:24 peer(B3D6=E2=80=A6YQVk) - Sending handshak=
e initiation


These cases are fine with me, however, sometimes this happens:

ERROR: (wg0) 2021/09/03 18:16:38 Failed to read packet from TUN
device: netlink socket closed: resource temporarily unavailable

After which `device.Close()` is called and the program exits.

Is it possible to change this behavior?

I don't know much about wg internals _or_ golang, so I tried this silly pat=
ch:

diff --git a/device/send.go b/device/send.go
index c4aa5b9..b02814f 100644
--- a/device/send.go
+++ b/device/send.go
@@ -272,7 +272,9 @@ func (device *Device) RoutineReadFromTUN() {
                if err !=3D nil {
                        if !device.isClosed.Get() {
                                logError.Println("Failed to read
packet from TUN device:", err)
-                               device.Close()
+                               device.PutMessageBuffer(elem.buffer)
+                               device.PutOutboundElement(elem)
+                               continue
                        }

which, as you could expect, did not work. It does leave wireguard
running and the interface is still there, but the communication is
broken.

David


--=20
Stack is the new term for "I have no idea what I'm actually using".
