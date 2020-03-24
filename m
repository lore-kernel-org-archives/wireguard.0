Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7621C2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48CFB206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sKu+3zdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48CFB206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bed0b1f;
	Sat, 4 Apr 2020 22:36:01 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af605830
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Mar 2020 18:20:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id z5so112371wml.5
 for <wireguard@lists.zx2c4.com>; Tue, 24 Mar 2020 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=/rmPM5emvSq0/v4jafgXcDhU16J7oo25bTi9nfUee3s=;
 b=sKu+3zdROVr91VyB19sAcdqV/y2D0IZ444ZyaHw7CizxJetjRa+gKSL23SVJAjswGk
 IFYWIyGS49OvhVZfc0y5rJ/eX9NzwH5yaC9zkkrfuA9nveWB6qscYG4ubpaKski24gE6
 usA8GW9XBNNL6jEAGAUqeEeU7AjbqaBSIeWjOD1tRBNfsxPU9ksbpcKpPKkubQgUKYLI
 RY0SQ8oItF34xaq5To4LL/zv1lrlSZLYwv9a5OsVee4FsPA1bg4u1g3zxSxKLWSNzxpV
 HYMOIJAAjqbIRxHghv/n/vZteb7r2sj6JMaRfTUqby4LkMrYNhqzh4jyns78E23DnCGI
 CpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=/rmPM5emvSq0/v4jafgXcDhU16J7oo25bTi9nfUee3s=;
 b=mTRytFqEn6YiHyv0X2Bl1sUFaEngEtn7MROpJ1KTHny2OYvQv4gwFQ8fsfaC9ge85o
 bBbs8cCazsc97T1W4zefGmQNofnZnmECM2of1oq/3JRt7FtzpxJt+YIqfc9IsqNwXgIx
 AFQyK/1BoVDxna2N1ViCFUz1rSFc6mxH/N4BhnQ/tjBdtkSl/KdoN+463Sc5QSiqKNZ0
 mZcJfmwhf4qV1uf+GGuJP9K9+mAjQTzvg+ynO6qsa/U/TK+Gy0xLw449fipBkOBpPsmd
 cD8UqhrhyXROMn5RZLc7+kg/INHwsNdJDFvscMpMixAZ6qbkPEYiVDg4FGLlB5n+gaCq
 3q0w==
X-Gm-Message-State: ANhLgQ2EnusaqOZzVUuCkAMxtNnV74hALmBEZKpPgSQAB2q0TdAKzz0i
 dHKUwzUowu/ctgkud9efgP/tt0Dg+h8=
X-Google-Smtp-Source: ADFU+vv9067p95BxclBSMtn5epJEHO+AjpHrAcdyX1rRCCCGZkCzx+t4xmfnfLH7uGBDA2tQ1UTvgA==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr7526533wma.168.1585074479067; 
 Tue, 24 Mar 2020 11:27:59 -0700 (PDT)
Received: from ?IPv6:2a02:6d40:2bd6:9600:68bd:cb6d:7cdc:cf00?
 ([2a02:6d40:2bd6:9600:68bd:cb6d:7cdc:cf00])
 by smtp.googlemail.com with ESMTPSA id t2sm5378940wml.30.2020.03.24.11.27.58
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 11:27:58 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
Subject: MTU setting in WireGuard
Autocrypt: addr=o.freyermuth@googlemail.com; prefer-encrypt=mutual; keydata=
 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
 KB7t2CoZv5xo0STm
Message-ID: <328e0688-842c-8338-e94a-3bcbf6531491@googlemail.com>
Date: Tue, 24 Mar 2020 19:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:36:00 +0200
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

Dear WireGuarders,

I'm wondering about the MTU setting in the WireGuard interface section. 

My usecase is a VPN "server" node with many clients connecting to it. 
Some of the clients require a smaller MTU due to their internet provider. 
If I set a smaller MTU on the interface of the "server" node, i.e. the node everybody will connect to,
will that automatically enforce a smaller MTU for the clients communicating with it? 

Cheers,
	Oliver
