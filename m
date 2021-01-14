Return-Path: <SRS0=Ms3O=GR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CACC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 23:25:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3831B23A01
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 23:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3831B23A01
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51dd45da;
	Thu, 14 Jan 2021 23:25:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f47beff
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jan 2021 23:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610666740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Noz+q4c/GJ4FsFPotOxd5AKKU8SZEspDOhfb73woq/c=;
 b=VPRM5npzQ936zNAT8Vi8kQmFi9ZwXlpdLO7hcjSH+Wz/ah09Vq33StQSVYl6aWanIqxlX5
 FPrKpWqh/Xcqcw0XBEEFS2myF3BOHomnNvHKe0YN0Fep8RdMXKmmTIz4GTiGUGh5sAMB7r
 W0eP5infayTUsWErsjDGIbv3RfLCyFo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 401e5de9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jan 2021 23:25:39 +0000 (UTC)
Date: Fri, 15 Jan 2021 00:25:37 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Userspace Networking Stack + WireGuard + Go
Message-ID: <YADS8ehdQltHFpum@zx2c4.com>
References: <X/8aDfdkod+rCPqK@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X/8aDfdkod+rCPqK@zx2c4.com>
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

Another example, for the curious. This one hosts a web server entirely in
userspace. All the kernel sees are incoming and outgoing encrypted
WireGuard UDP packets.

    package main
    import (
        "io"
        "log"
        "net"
        "net/http"
        "golang.zx2c4.com/wireguard/device"
        "golang.zx2c4.com/wireguard/tun"
    )
    func main() {
        tun, tnet, err := tun.CreateNetTUN(
            []net.IP{net.ParseIP("192.168.4.29")},
            []net.IP{net.ParseIP("8.8.8.8"), net.ParseIP("8.8.4.4")},
            1420,
        )
        if err != nil {
            log.Panic(err)
        }
        dev := device.NewDevice(tun, &device.Logger{log.Default(), log.Default(), log.Default()})
        dev.IpcSet(`private_key=a8dac1d8a70a751f0f699fb14ba1cff7b79cf4fbd8f09f44c6e6a90d0369604f
    public_key=25123c5dcd3328ff645e4f2a3fce0d754400d3887a0cb7c56f0267e20fbf3c5b
    endpoint=163.172.161.0:12912
    allowed_ip=0.0.0.0/0
    persistent_keepalive_interval=25
    `)
        dev.Up()
        listener, err := tnet.ListenTCP(&net.TCPAddr{Port: 80})
        if err != nil {
            log.Panicln(err)
        }
        http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
            log.Printf("> %s - %s - %s", request.RemoteAddr, request.URL.String(), request.UserAgent())
            io.WriteString(writer, "Hello from userspace TCP!")
        })
        err = http.Serve(listener, nil)
        if err != nil {
            log.Panicln(err)
        }
    }

Here's a gif: https://data.zx2c4.com/wireguard-go-userspace-networking-to-host-a-server.gif
