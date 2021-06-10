Return-Path: <SRS0=GgA3=LE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923C5C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 22:53:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794F2613E7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 22:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794F2613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tailscale.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0494ee26;
	Thu, 10 Jun 2021 22:53:15 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84d40e16
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 22:34:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i10so5638234lfj.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 15:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tailscale.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ne3UvSlij1xUywyg3yg8nUVznRxDLKfVX7j97Ath18E=;
 b=KPDLegIIQqLPg5PeUtj8lpWQ9PHkwO1oZ8XFyW6IIeBGNJyjWmNTGquM4pmGkwAYHJ
 k8vRaiDCWpxYKBkQ8V/CPklk6bwtG9BqlsnhaP+tSKre+fmQRRZOZHgnWc5ezsB5ILms
 gIBuwC9NsrrOHizRDkcnvKNbx+IBRYMEncxEGODyED3jyCVrm3DI81gS46cngftyGPMt
 Ic4BmL2PL2B0ePdi878Swp6K+7oi2NIigvgWJ+HkIIvcC48fAZplP/ewoXUNXc3IJqpH
 9ky6wq77MS4waMNBd9wGrfCj/PVSxRPvaX6Zn4oOqkduFx+0ILHccYSj9H4st2CdiY24
 Peow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ne3UvSlij1xUywyg3yg8nUVznRxDLKfVX7j97Ath18E=;
 b=RNqE2uhpXa/B3dmbxHywPg2MLOe6Btj1Mn9GDKtxMGLwXzRvCvHuCgUXlKuiqvhkuL
 SthBr11XPYg6+zFzl+RDd2U/L+W33y6RZ7An46m40MA8dhbUSYbVsGdvRHwVlkx8FAJe
 eJnLCyMw/xsmHOEJmoaliIYn04eCQxTiTLUpZonURg92Ce/XNs5+xsfayws0/j17vIQh
 d6MsC0ucFVGWlwHjjZ9j1BF4j1VKXA2oAT+fk0p59iFVqUjxkmBMdU46iWgpPFqUb3sQ
 IyIMdihcbki4xcqywMd21GwYeIr7lhfj/Y0zmK4E7R2BG2eiaAYmuHDkHev3a3KaeWqk
 ct6Q==
X-Gm-Message-State: AOAM532qJ1zFk9WJhsopXe3xd456Deot7fC3pybzpUurrGVNzVBEkIkD
 p4+BdWL6me2ow1BfLWnE5rx7j4TMF+FKFiDfkGM0gw==
X-Google-Smtp-Source: ABdhPJxJaLl25/MeYFOX/FrE8m+4xB62V+BGG0L6qp4+NoZU2nJ+AIYYkarlILrzuBwSnZDCe+kSJpJ1PhF7obtU5WQ=
X-Received: by 2002:a05:6512:32a5:: with SMTP id
 q5mr600247lfe.171.1623364444280; 
 Thu, 10 Jun 2021 15:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
In-Reply-To: <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
From: David Crawshaw <crawshaw@tailscale.com>
Date: Thu, 10 Jun 2021 15:33:53 -0700
Message-ID: <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
Subject: Re: WireGuard is broken on iOS 15 beta
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Jun 2021 22:53:14 +0000
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

I finally managed to get a device running iPadOS 15 and an Xcode 13
beta. This technique works. Some modified code with logging:

func tunnelFD(provider: NEPacketTunnelProvider) -> Int32 {
    os_log("tunnelFD searching")
    var buf = [CChar](repeating: 0, count: Int(IFNAMSIZ))
    for fd: Int32 in 4...64 {
        var len = socklen_t(buf.count)
        if getsockopt(fd, 2 /* SYSPROTO_CONTROL */, 2, &buf, &len) == 0 {
            let str = String(cString: buf)
            os_log("%{public}@", "tunnelFD \(fd): \(str)")
            if str.starts(with: "utun") {
                os_log("tunnelFD found likely fd")
                return fd
            }
        }
    }
    os_log("tunnelFD found nothing")
    return -1
}

produces the logs:

    tunnelFD searching
    tunnelFD 7: utun3
    tunnelFD found likely fd

Note that the current technique of calling
provider.packetFlow.value(forKeyPath: "socket.fileDescriptor") causes
the NetworkExtension to crash under iOS 15. The logs say the kernel
sandbox killed it:

    Sandbox: process(525) deny(2) file-test-existence /private/etc/.mdns_debug

On Thu, Jun 10, 2021 at 8:44 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> I won't have an updated OS to test this out in until next week at the
> earliest, but perhaps this hack will work?
> https://git.zx2c4.com/wireguard-apple/commit/?h=jd/fd-search-hack
> Let me know if that is successful, or if it blows up.
>
> Jason
