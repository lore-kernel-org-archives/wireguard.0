Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FROM_WEBSITE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40BFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE25E65256
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE25E65256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cec6d70b;
	Tue, 9 Mar 2021 21:05:26 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af2d47c7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 13:45:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d13so20246307edp.4
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=vXaYSj/1XMNoSa0FtidgBcZ6E2DxJJQPnvi3b+vPjH4=;
 b=H/IWYgzUNxUxDeAtjDQQL5ACD9OK03RoC/Ye8ZVbbEY8d6a6SW+0VxIcqSUMFw2NVr
 HhuKHPt+68xKBbVZCYfhey8ETNWQjb5VAI7gwbGampFJmV5VJIYn1i5tiyUcsvd/O0tW
 hDzEGU7qv0nm7Oy1bkHzhMK+o+mWzZulFZQsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vXaYSj/1XMNoSa0FtidgBcZ6E2DxJJQPnvi3b+vPjH4=;
 b=UtFX1rckAHcvr3Fs+qB6h7OFDTfvwHrbzkx3U7XF2Bkm321cUttTMMpTfBrHwkpyB6
 KxE1hFApsk1uRZ0k0kv4CSBtD9avsOps6npQWoMy0mLSWbROewF5jIpszj1uy7oGJg1/
 0qmi7aEhTlMCGuLrCaEgfXweyXqk7pQIyQyLG9PwFDxq9ObtoodWnLwY8HGLOfR6QCHF
 vLQuZ7EMjp664pzV7wKthIXG2yHz8T81ljzUD7xLk9nsLCbBg+rHGIzJ2jmR1OVvU6O0
 rcssM4WkshSLsbaZsFX0i10XttZHcrFXsYAsUndWUKHrxQkQrfU7EkMSutvVIW0VucQK
 RqkA==
X-Gm-Message-State: AOAM5336CBu1S34jZ3qkcL252zwfIvOJHBtghrAcjlm9ycPyQ2WoRHrh
 chMbO5/1BJbOS2tJ7cKWI5G6S1yweBxhML6Z6aZ0w6SnChsDuIeb
X-Google-Smtp-Source: ABdhPJwTgDlaR9ylebPZ8+Mj7n6ZJhltYvfUeFmoInyNUfnTN2teR4zi78Y1fkl+WFtLbquvdOKarmLfibVFH7pBVns=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr4269798edt.130.1615297508066; 
 Tue, 09 Mar 2021 05:45:08 -0800 (PST)
MIME-Version: 1.0
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Tue, 9 Mar 2021 21:44:56 +0800
Message-ID: <CAKVinOUJVEyxfT-bOhUe4gZb7yUN_=xwun13pnt+iDZus=LRXQ@mail.gmail.com>
Subject: Any possibility to run wireguard-go with android vpnservice?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Mar 2021 21:05:22 +0000
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

Sorry for bothering,
I'm trying to run wireguard-go with android vpnservice:

first, I started a vpnservice and got the fd integer:

vpnConn=builder.establish();
int fd=vpnConn.getFd();

The key icon showed on the right-top corner of android phone and the
fd  value is 114.

then, I modify tun_linux.go of wireguard-go:
func CreateUnmonitoredTUNFromFD1(fd int) (Device, error) {
    err := unix.SetNonblock(fd, true)
    if err != nil {
        return nil, err
    }
    file := os.NewFile(uintptr(fd), "/dev/tun")
    tun := &NativeTun{
        tunFile: file,
        events:  make(chan Event, 5),
        errors:  make(chan error, 5),
        nopi:    true,
    }
    //name, err := tun.Name()
    if err != nil {
        return nil, err
    }
    return tun, nil
}

and modify main.go :

    tun, err := func() (tun.Device, error) {
        tunFdStr := os.Getenv(ENV_WG_TUN_FD)
        if tunFdStr == "" {
            return tun.CreateTUN(interfaceName, device.DefaultMTU)
        }
        fd, err := strconv.Atoi(tunFdStr);
        return tun.CreateUnmonitoredTUNFromFD1(fd);

But when I run this in android directory /local/data/tmp:

WG_TUN_FD=114 ./wireguard-go wg0

It gives me: Failed to create TUN device: bad file descriptor


It seems that my try is nonsense,
but is there any possibility to run wireguard-go with vpn service
without gomobile jni?


Thanks.

Malcolm Ke
