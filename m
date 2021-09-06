Return-Path: <SRS0=0dHh=N4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6444C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Sep 2021 11:49:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C613360F14
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Sep 2021 11:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C613360F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f74dbccf;
	Mon, 6 Sep 2021 11:49:51 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e4b27da9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Sep 2021 11:49:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g22so9149220edy.12
 for <wireguard@lists.zx2c4.com>; Mon, 06 Sep 2021 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=bgavMaB1QB0I3Vem8nI9ARSL3eQ52vEhAox6un6rYp8=;
 b=Cmd1/lFWsGxNRHL5OlvBOszMbMzTlXLfuTDE3voztiuxcsvE/M4pKGyLIu2EDlAu6z
 ETE1bErUzrkCcmAblzqtv4oxvWIfa8G1HL8zwl1VYORlewOhInC5W4T/Do2ZOmPQCmp2
 xVmKTbO0zsR303fisSOUVF9LBTRty9tKG5Raf2nM5tZdJAjEukqDyYdriD+hxg9MdDAg
 BJJnnzhldbww4hWCf0VFAGpBuUk0toMlsbbX5v3Cw/zoqB79UTEs/FwB9P7Z5zES/QQH
 4kwhfHuNOwBzt7O2WebEAtmOnKAGYDuaPrvDAVoSSBLJnNI+JgTqWDFvFTqwx+0vDBwX
 zX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bgavMaB1QB0I3Vem8nI9ARSL3eQ52vEhAox6un6rYp8=;
 b=d1iSz5trFg+Tv0hyEB/kZ7M8JX/QogAUsDHlCjv+atYAjndTp7HoeMhB1+6lzSVPSd
 jzrQHSowcU0j+j/JDMsTcUrcg2ZLOVQ1nBedXj1+wKicpS/XIDU3xtw7pHAM5AuThCpW
 wlAkNiU6iTApMgbJAJQzAZNY5efr72+01n3NRYRAcrJEkuPOYUCKK89x7RWZmpMpiDhw
 9upov7IeWUnYgXQfhgSDj2Ie344nGBzNncTg+q/gJ3A1DC9t+9znp0MNjkocoJ3YwLN9
 Qr4mk+SxA54maSAyMG4BoYHnkEXzbHzDVCSIzY0lzVhxLczCvSvlFSHrrY1FkQ13jSlY
 wVEA==
X-Gm-Message-State: AOAM533qn3a0FhJMH4fw5jk4zQDdm92F67wXcpaF2pDhEtz5BmHAoOIq
 sZj6D0//Kdw8UW1S+TsWcca9S5lvg2FeNi9iZjDDBnok9rb8hg==
X-Google-Smtp-Source: ABdhPJzA7bPfad3eqPgGgfwTZ7GV0bzCdlNsFtFDaC16OP7qEEsyb8tfEX6bp4u6cnLs/kjsZ2z4Caw0l4wb/6KPfrg=
X-Received: by 2002:aa7:da56:: with SMTP id w22mr12945764eds.89.1630928989117; 
 Mon, 06 Sep 2021 04:49:49 -0700 (PDT)
MIME-Version: 1.0
From: Hiroshi Shirosaki <h.shirosaki@gmail.com>
Date: Mon, 6 Sep 2021 20:49:37 +0900
Message-ID: <CAOWZXk1LsG_kr3JD8kTkY1U1pp4uq5Vc3DR29hX_Af+XD=QDBA@mail.gmail.com>
Subject: Wireguard Windows tunnel editing does not draw correctly with
 vertical scroll down
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

When I edit my tunnel setting that has multiple peers and input keys
with vertical scroll down,
the inputted characters are not shown correctly.
It looks like the old contents remain.

Without vertical scroll down the inputted characters are shown correctly.

It seems EM_SETCHARFORMAT and RedrawWindow don't play nicely together.

I use Wireguard-windows amd64 0.4.5.

I've found that adding window hide/show around EM_SETCHARFORMAT seems
to fix the redraw issue.
Here is a patch.

diff --git a/ui/syntax/syntaxedit.go b/ui/syntax/syntaxedit.go
index 42f6e7b7..7b88271a 100644
--- a/ui/syntax/syntaxedit.go
+++ b/ui/syntax/syntaxedit.go
@@ -247,6 +247,8 @@ func (se *SyntaxEdit) highlightText() error {
  win.SendMessage(hWnd, win.EM_SETBKGNDCOLOR, 0, uintptr(bgColor))
  numSpans := len(spans)
  foundPrivateKey := false
+ // Workaround to redraw correctly with vertical scroll down
+ win.ShowWindow(hWnd, win.SW_HIDE)
  for i := range spans {
  span := &spans[i]
  if numSpans <= 2048 {
@@ -262,6 +264,7 @@ func (se *SyntaxEdit) highlightText() error {
  foundPrivateKey = true
  }
  }
+ win.ShowWindow(hWnd, win.SW_SHOW)
  win.SendMessage(hWnd, win.EM_SETSCROLLPOS, 0,
uintptr(unsafe.Pointer(&origScroll)))
  win.SendMessage(hWnd, win.EM_EXSETSEL, 0,
uintptr(unsafe.Pointer(&origSelection)))
  win.SendMessage(hWnd, win.EM_HIDESELECTION, win.FALSE, 0)

-- 
Hiroshi Shirosaki
