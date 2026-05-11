Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA1ACD37AC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2026 06:42:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id af38b74e;
	Mon, 11 May 2026 06:42:31 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2704102f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2026 06:42:29 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-57512a429d1so2747258e0c.3
 for <wireguard@lists.zx2c4.com>; Sun, 10 May 2026 23:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778481748; x=1779086548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmM7uPcTxOtt/CXqxfbtSzgj1ys1bMpqCcKcPX8L8Aw=;
 b=Wmda2jK3k2ztYKz6SiaABAzpt9w8v/XzqsBgzf1a9ZwuzlToq8OAfki1cuU8oy3nkC
 V9cMAkHZBQ21GQYVOGcvBelGQcpYq0SfjliTp+G1tqqVL+zWZcjJipXpV8hn3pFMmRv8
 JOxrYL4zbPpZQuyJAhqU9UgOtOnpRzXgYvoTpqt10XXcNxfFRItEPoc7J8JZQ6hw52ln
 G3CTjNz0Oij+AO4OlyxC+INj19TIM0zSLb1peQKWxAxq+BcJqpK9DIIzxNDyKaMZYtFH
 NMjfafjMiriQeRDdWNII8VOY54tHUUT9rz5+/IcoZOND/spHxnXmP7iVrCnYGQf9bcX8
 XSYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9C2bTgO7K2mXxLzIefF2gwmAE09oYv9zPYMiVw/KHWZshiKxK5LH62y7OwvbtC8iYtRcoNk7K2Axk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzAQFwDV3pUPJ9r5EoQFHj0L2CW5BpOGJZVwJWJg0OLRD3g/M9y
 m3ZHXC5flTcwXJVHW4gq79Gp4KTkDUUTTNGd//FNJ3EhiAp18AQXANbzNXpyS5z1
X-Gm-Gg: Acq92OFU9xS7tjcenTmRhkMlK6kczVEOhK5EHhU/qunZqbJ75BIV/kvBPXAjtGwC9Fh
 qbWz+0TRbjAwK0wwmXOGYJXYXfaOCU2B6HbRkmm+cJtUDUqL0MnApX6CeREOtIIWV/6lUe0USKh
 +i0y8rnWVaiW15hGmkNzFvGp3kUUXwvwYOPdOiv2wH5PXoDmeP2bL+PdPs9JmOqJYnoZ3CwvX+9
 fvjtGpdSxN8RrcW3mQx3kFiXVuW1duDpUmN0NpKDGPOvHuHaijfB/ysKLMz5G+PRuI7nTmPxZhl
 Hif7N4JD+6Td5UxofqUdN08nebSiA4XImV38hdazvDSkXft7pPAWKknBrnFJSdxTAXm6rpBc6fS
 ulg/Kse4gybpoJeMxDkxdXRDeBmdQ38ABXIbBIMqGH96C3ixk/6E8Rd66pvSy9VT+w3R9Fjrwwo
 C9uPjIMpq3r+WAJxXY8UfaNItEFuTOArhrVRhxzhGZgwGFpUaav0e56UYj+uUM
X-Received: by 2002:a05:6122:660e:b0:56f:6b46:28be with SMTP id
 71dfb90a1353d-57559520fccmr13501635e0c.8.1778481747685; 
 Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-574a6ef4012sm19524929e0c.18.2026.05.10.23.42.26
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-6312af106e3so2231632137.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 May 2026 23:42:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/ofZbQC4hXsHzhsl4+fMkWFUSXO604HfbjH2rp/dfXWIzue4plCXrbkNBCXtZKK7EHSMrGCpFj3Wc=@lists.zx2c4.com
X-Received: by 2002:a05:6102:2ac7:b0:633:c6c4:b32c with SMTP id
 ada2fe7eead31-633c6c4b990mr1428757137.15.1778481746411; Sun, 10 May 2026
 23:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <202605100125.l4JVHppO-lkp@intel.com>
In-Reply-To: <202605100125.l4JVHppO-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 08:42:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
X-Gm-Features: AVHnY4LhC2w7Nls0eAOnAROXGmHfJhM8ihUdL8l1JwrVFRMxvNzDPSpVspNG9hQ
Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
Subject: Re: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is
 larger than 1024 bytes
To: kernel test robot <lkp@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, oe-kbuild-all@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wireguard@lists.zx2c4.com
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

On Sat, 9 May 2026 at 19:07, kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ec89572766744e844df24c27d31c97b4c00f4e07
> commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
> date:   9 months ago
> config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605100125.l4JVHppO-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    crypto/ahash.c: In function 'crypto_hash_digest':
> >> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>     1073 | }
>          | ^

This is one of the few defconfigs that still use CONFIG_FRAME_WARN=1024.
The default value for 32-bit systems was lifted from 1024 to 1280 in
commit 32115734c0ed8b46 ("Increase the default 32-bit build frame size
warning limit to 1280 bytes") in v6.18, so perhaps the downgrade to
1024 should be dropped from the following defconfigs:

$ git grep CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq5_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6lplus_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/lemote2f_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/loongson2k_defconfig:CONFIG_FRAME_WARN=1024
arch/powerpc/configs/fsl-emb-nonhw.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/arm.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/armeb.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/i686.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/m68k.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mips.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mipsel.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/powerpc.config:CONFIG_FRAME_WARN=1024

I am not sure about the wireguard selftests: they might use the lower
value deliberately for testing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
