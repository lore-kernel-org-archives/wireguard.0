Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66964C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 May 2022 10:54:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 88768ca9;
	Thu, 26 May 2022 10:51:54 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f4051a03
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 May 2022 09:24:56 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q130so1790329ljb.5
 for <wireguard@lists.zx2c4.com>; Wed, 18 May 2022 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=cZMNLZ3KEGTGghlDFVi3fpZK5+5SsbuM+QdFHdn7gJk=;
 b=jcA4ay0vTmB4D4kkBqa22njOdw89MfZOQRQqTd0eucUzgRpsT0Fndb7BQTL/XqajS8
 bfEZAxDXxv5rljpU9gpAg13HfKM462qOZmAATVgHN76ZofG26ophHJ6tV1SYGzYYJOwn
 fqvjSg5T6EXUZRy2iVM2PmXMGCkeJ7Vq71Knx0PlS9Jv5lhcfoDeQv1FSPv6Q27RLM6Z
 f2ktD0irM3skso46NvtpjbwhAJyeeRmmD+wd6c5XzgJBYywGFMoMLjKs6Ttd8P0n0VvH
 MUPZsUehkAYQ9oPCZXQIPTzdJOH4a14QVaGjG172wGhl6AMwLULidGiBEO7XN1RSkPdi
 5BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=cZMNLZ3KEGTGghlDFVi3fpZK5+5SsbuM+QdFHdn7gJk=;
 b=bhFDsZAPR9rWq5UIQ09VDe6MtCFVLc6q3RlQP9KLx2kxPx6b+2ipZCIEj7uXdeCk5c
 oFy6Lhc4DjovlxzFITFwj8o+lbVVuGvRN8smkdpQmaCWocaDqlFnYQtu3Qmvt/L+ZvSb
 1/4jOnsHiZs/fa+wOPWajY6fQ+qBwuT36VREeMJ0RtMhraYf3jCeQgr2DDlOWcT9wFUC
 2xgcA73Xzi/Zu8uR4q303s9thNoDrdln0c6xBbGQKs+SEEz/VdgVPXG2jbIldv7BIwnR
 TUJZn5Z2SX+Bmmv+stQXthICAgyrTFF/gKkLiJacuc9Re5vD4p3wPZRWgHu+Ds+UED1/
 u92A==
X-Gm-Message-State: AOAM532lEgBeDruUKzd+aguT+X6+jGsMfmUW3s8YhsnJvITNQZpJXySU
 k/RuYKlOY99w0ksBJnjyE35lSjIBBg==
X-Google-Smtp-Source: ABdhPJyr3jTci/mkM3KjBVFn2vWHZhsLFBJwIWLyJ+52aco6FAPJaLWu4TOmWV139CCLnbmXiw81wA==
X-Received: by 2002:a2e:3317:0:b0:253:ccd3:fbb6 with SMTP id
 d23-20020a2e3317000000b00253ccd3fbb6mr539106ljc.391.1652865895339; 
 Wed, 18 May 2022 02:24:55 -0700 (PDT)
Received: from [192.168.105.104] ([193.56.104.197])
 by smtp.gmail.com with ESMTPSA id
 u30-20020ac251de000000b00472ce7a8cfesm153797lfm.28.2022.05.18.02.24.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 02:24:54 -0700 (PDT)
Message-ID: <4c3ffcc9-82e2-6295-03b3-d26b3bf3d7fc@gmail.com>
Date: Wed, 18 May 2022 11:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Konrad Sewillo-Jopek <kjopek@gmail.com>
Subject: if_wg on BeagleBone black
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 May 2022 10:51:53 +0000
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

Hey folks,

here is what I get when trying to ping anything else after
if_wg is up and running on my BeagleBone Black:

root@beagle:~ # wg show
interface: wg0
public key: <removed>
   private key: (hidden)
   listening port: 39856

peer: <removed>
   preshared key: (hidden)
   endpoint: <removed>
   allowed ips: 10.11.12.0/24
root@beagle:~ # ping 10.11.12.1
PING 10.11.12.1 (10.11.12.1): 56 data bytes
Fatal kernel mode data abort: 'Translation Fault (L1)' on read
trapframe: 0xd7195be0
FSR=00000005, FAR=00000278, spsr=40000013
r0 =00000000, r1 =00000000, r2 =00000001, r3 =00000000
r4 =d1626a18, r5 =d1626b2c, r6 =0000005c, r7 =00000000
r8 =d159c000, r9 =d1493900, r10=d7cd7aa8, r11=d7195c78
r12=d7b378f8, ssp=d7195c70, slr=d7b14c80, pc =c042f854

panic: Fatal abort
cpuid = 0
time = 1652353064
KDB: stack backtrace:
#0 0xc0355b70 at kdb_backtrace+0x48
#1 0xc02fcb50 at vpanic+0x170
#2 0xc02fc9e0 at vpanic+0
#3 0xc061bc14 at abort_align+0
#4 0xc061b704 at abort_handler+0x2a0
#5 0xc05fac68 at exception_exit+0
#6 0xc042f854 at if_inc_counter+0xc
#7 0xd7b14c80 at wg_softc_handshake_receive+0x8d0
#8 0xc035466c at gtaskqueue_run_locked+0x1b8
#9 0xc0354204 at gtaskqueue_thread_loop+0x1b0
#10 0xc02b4b38 at fork_exit+0xc0
#11 0xc05fabf8 at swi_exit+0
Uptime: 3m23s
Automatic reboot in 15 seconds - press a key on the console to abort

Do you know, what may be the cause?
Some stuff on the path suggests some counters are misaligned.

Regards
Konrad Sewiłło-Jopek

